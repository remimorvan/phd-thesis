from pathlib import Path
import sys

def find_ext(dr: Path, ext: str) -> list[Path]:
    """
    Lists all files present in a directory (and its subdirectory, recursively)
    that ends with some given extension.
    """
    return list(dr.glob(f"**/*.{ext}"))

assert(len(sys.argv) >= 2)
tex_files = find_ext(Path(sys.argv[1]), "tex")
# print(tex_files)
for tex_file in tex_files:
    file = open(tex_file)
    f_content = file.read()
    kl = f_content.count("\"") - f_content.count("\\\"")
    if kl % 2 != 0:
        print(f"In file {file}: uneven number ({kl}) of \".")
    open_br = f_content.count("{") - f_content.count("\\{")
    close_br = f_content.count("}") - f_content.count("\\}")
    if open_br != close_br:
        print("In file " + str(tex_file) + ": number of { (" + str(open_br) + ") does not match number of } (" + str(close_br) + ").")
print("Done.")