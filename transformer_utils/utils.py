import torch
import transformers
import parso

def get_model_by_name(model_name, device):
    # ↓ load the tokenizer for *exactly* the same model you’re going to load
    print("Loading:", model_name, device)
    tokenizer = transformers.AutoTokenizer.from_pretrained(model_name, use_fast=True)

    model = transformers.AutoModelForCausalLM.from_pretrained(
        model_name,
        pad_token_id=tokenizer.eos_token_id
    )
    model.to(device)

    if device.type == 'cuda' and hasattr(model, 'parallelize'):
        print("Going to parallelize")
        model.parallelize()

    return model, tokenizer

def is_valid_python_prefix(code: str):
    # load grammar only once (like a static variable)
    if not hasattr(is_valid_python_prefix, "grammar"):
        is_valid_python_prefix.grammar = parso.load_grammar(version='3.9')
    grammar = is_valid_python_prefix.grammar
    
    try:
        #this will determine any issues with the code
        module = grammar.parse(code, error_recovery=False)
    except parso.ParserSyntaxError as e:
        print("In exception:")
        print(e)
        #ENDMARKER means issue was "code ended too early" (like x=), so that's a valid prefix
        #DEDENT is similar but for ending indented blocks
        token = e.args[1].token_type
        value = e.args[1].value.strip()
        
        return token.name == "ENDMARKER" or (token.name == "DEDENT" and value == "")
    else:
        #it it completed the parsing without erroring, see if other error:
        if grammar.iter_errors(module):
            print("Other error(s):")
            for error in grammar.iter_errors:
                print(error)
            return False
    #if no error was caught, must be fine
    return True

if __name__ == "__main__":
    t = is_valid_python_prefix("def foo(a):\n\tx=\nfoo(5)")
    print(t)
