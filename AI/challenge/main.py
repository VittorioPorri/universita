import pandas as pd
import emoji


pd.set_option("display.max_columns", None)
pd.set_option("max_colwidth", None)


def read_csv(file_path):

    dataframe = pd.read_csv(file_path, encoding='utf8')

    return dataframe

# â€“ => encoding in cp1252 => decoding utf8 => -

def clear_sentence(sentence):
    """
    Utilizzare tutte le funzioni all'interno di questo metodo per interpretare una frase
    => utilizzare tutti i metodi e poi fondere i diversi risultati
    """

    try:
        # interpreta caratteri tipici della lingua italiana
        # è, é, ì, ù, à, ò
        sentence_with_italian_chars = sentence.encode("latin").decode("utf-8")
        print(f"{sentence_with_italian_chars=}")
    except Exception as e:
        print(sentence)
        print(e)
    
    try:
        # interpreta caratteri strani come -, '
        sentence_in_cp1252 = sentence.encode("cp1252").decode("utf-8")
        print(f"{sentence_in_cp1252=}")
    except Exception as e:
        print(sentence)
        print(e)


    try:
        # converte emoji testuali in emoji visive
        # :thumbs_up: => 👍
        sentence_with_emojize = emoji.emojize(sentence)
        print(f"{sentence_with_emojize=}")
    except Exception as e:
        print(sentence)
        print(e)
    
    try:
        # converte emoji visive in emoji testuali
        # 👍 => :thumbs_up:
        sentence_with_demojize = emoji.demojize(sentence)
        print(f"{sentence_with_demojize=}")
    except Exception as e:
        print(sentence)
        print(e)



    return sentence


if __name__ == "__main__":
    df = read_csv("/home/vitto/github/universita/AI/challenge/data/train.csv")
    
    """ 
    # Per il file train.csv

    i = 0
    for id, text in zip(df['ID'].tolist(), df['Text'].tolist()):
        id_intero = int(id)
        print(f"{id=}\t{id_intero=}\t{text=}")
        print(50*"*")
        i += 1
        if i > 15:
            break
    """

    # Per il file test.csv

    i = 0
    for id, text, label in zip(df['ID'].tolist(), df['Text'].tolist(), df['Label'].tolist()):
        id_intero = int(id)
        #print(f"{id=}\t{id_intero=}\t{text=}\t{label=}")
        clear_sentence(text)
        print(50*"*")
        i += 1
        if i > 5:
            break
