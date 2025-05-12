import sys

def parse_bibtex(file: str):
    return file.split("\n\n")

def format_id(id: str):
    if '_' in id:
        id_elements = id.split('_')
        if len(id_elements) < 3:
            raise Exception()
        new_id_elements = [x.capitalize() for x in id_elements]
        if not(new_id_elements[1].isnumeric()):
            date = new_id_elements.pop(-1)
            new_id_elements.insert(1, date)
        new_id = ''.join(new_id_elements)
        return new_id
    else:
        i = 0
        while i < len(id) and not(id[i].isnumeric()):
            i += 1
        while i < len(id) and id[i].isnumeric():
            i += 1
        new_id = id.capitalize()
        return new_id[:i] + new_id[i].capitalize() + new_id[i+1:]

TO_REMOVE = ["editor","isbn", "issn", "timestamp", "bibsource", "biburl", "address", "urn"]

def remove_useless_shit(entry: str):
    lines = entry.split('\n')
    def keep_line(l):
        if '{' in l and '}' not in l:
            return True
        if any([x in l for x in TO_REMOVE]):
            return False
        if "url" in l and not "\\url" in l and "doi" in entry:
            return False
        return True
    return "\n".join([l for l in lines if keep_line(l)])


def format(entry: str):
    entry = remove_useless_shit(entry)
    try:
        entry_list: list[str] = entry.split('{')
        if len(entry_list) < 2:
            raise Exception()
        first: list[entry] = entry_list[1].split(',')
        id = first[0]
        new_id = format_id(id)
        first[0] = new_id
        entry_list[1] = ','.join(first)
        return (id, new_id, '{'.join(entry_list))
    except:
        return ("parsing error", "parsing error", entry)


assert(len(sys.argv) >= 2)
filename = sys.argv[1]
with open(filename, "r") as f:
    entries: list[str] = parse_bibtex(f.read())
f.close()
# print(entries)
for e in entries:
    if e == '':
        print('')
    else:
        old_id, new_id, new_entry = format(e)
        print(old_id)
        print(new_id)
        print(new_entry)
        print("\n")