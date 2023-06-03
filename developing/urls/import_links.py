import json
import requests

No_of_books = 100

list_of_categories = ['science_fiction', 'fantasy', 'romance', 'mystery', 'drama', 'action_&_adventure', 'history']

def list_authors(authors):
    author_list = []
    for author in authors:
        author_list.append(author['name'])
    return author_list

file_name = "medium_cover_urls_2.txt"

with open(file_name, "w") as file:
    for category in list_of_categories:
        response = requests.get(f"https://openlibrary.org/subjects/{category}.json?limit={No_of_books}")
        data = response.json()

        for i in range(No_of_books // len(list_of_categories)):
            try:
                book_title = data['works'][i]['title']
                m_cover_path = f"https://covers.openlibrary.org/b/OLID/{data['works'][i]['cover_edition_key']}-M.jpg"
                file.write(f"{book_title}: {m_cover_path}\n")

            except KeyError:
                print("No cover URL found for book", i + 1, "in category", category)
            except IndexError:
                print("IndexError: No more books found for category", category)

