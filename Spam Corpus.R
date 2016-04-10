spam_corpus <- "/Users/digitalmarketer1977/Desktop/spamham/spam_2"
spam_corpus <- Corpus(VectorSource(spam_corpus))
spamtdm <-TermDocumentMatrix(spam_corpus)
spamtdm

ham_corpus <- "/Users/digitalmarketer1977/Desktop/spamham/easy_ham"
ham_corpus <- Corpus(VectorSource(ham_corpus))
hamtdm <-TermDocumentMatrix(ham_corpus)
hamtdm
