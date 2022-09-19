class BooksController < ApplicationController
  def create
    client = Notion::Client.new
    properties = {
      'Title': {
        'title': [
          {
            'text': {
              'content': 'Tuscan Kale'
            }
          }
        ]
      },
      'Author': {
        "rich_text": [
          {
            "type": "text",
            "text": {
              "content": "Some more text with "
            }
          },
        ]
      },
      "Category": {
        "select": {
          "name": "Book"
        }
      },
      'Full Title': {
        "rich_text": [
          {
            "type": "text",
            "text": {
              "content": "Tuscan Kale: The Adventures of"
            }
          },
        ]
      },
      "Last Highlighted": {
        "date": {
          "start": "2021-05-11T11:00:00.000"
        }
      },
      "Last Synced": {
        "date": {
          "start": "2021-05-11T11:00:00.000"
        }
      },
      "URL": {
        "url": "https://notion.so/notiondevs"
      },
      "Highlights": {
        "number": 1234
      }
    }
    client.create_page(
       parent: { database_id: ENV['NOTION_DATABASE_ID']},
       properties: properties
    )
  end
end
