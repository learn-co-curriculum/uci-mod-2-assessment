RSpec.describe "HTML Exam" do
  it 'begins with a valid doctype' do
    expect(parsed_html.children.first).to be_html5_dtd
  end

  it 'has a top-level <html> tag to enclose the document' do
    expect(parsed_html.child.name).to match(/html/i)

    expect(html_file_contents).to include('<html>')
    expect(html_file_contents).to include('</html>')
  end

  context 'within <html>' do
    it 'contains a <head> tag to enclose the header' do
      head = parsed_html.search('html > head').first
      expect(head.name).to eq('head')
      expect(html_file_contents).to include('</head>')
    end

    context 'within <head>' do
      it 'contains a <title> tag to enclose the site title' do
        title = parsed_html.search('html > head > title').first

        expect(title.name).to eq('title')

        expect(html_file_contents).to include('</title>')
      end
    end

    context 'within <head>' do
      it 'contains a <link> tag to an external stylesheet' do
        link = parsed_html.search('html > head > link').first
        expect(link).to_not be_nil, "No <link> tag found in the <head>"
        expect(link.attributes["href"]).to_not be_nil, "The 'href' attribute is missing in the link tag"
      end
    end
  end

  context 'within <html>' do
    it 'contains a <body> tag to enclose the body of the document' do
      body = parsed_html.search('html > body').first
      expect(body.name).to eq('body')
      expect(html_file_contents).to include('</body>')
    end

    context 'within <body>' do
      it 'contains <header> tags to create a header section' do
        expect(html_file_contents).to include('<header>')
        expect(html_file_contents).to include('</header>')
      end
    end

    context 'within <body>' do
      it 'contains <nav> tags to create a nav section' do
        expect(html_file_contents).to include('<nav>')
        expect(html_file_contents).to include('</nav>')
      end
    end

    context 'within <body>' do
      it 'contains <section> tags to create a section' do
        expect(html_file_contents).to include('<section')
        expect(html_file_contents).to include('</section>')
      end
    end

    context 'within <body>' do
      it 'contains an id attribute to identify a section' do
        expect(html_file_contents).to include('<section id=')
      end
    end

    context 'within <body>' do
      it 'contains <h1> tags to create a first-level heading' do
        expect(html_file_contents).to include('<h1>')
        expect(html_file_contents).to include('</h1>')
      end
    end

    context 'within <body>' do
      it 'contains <h2> tags to create a second-level heading' do
        expect(html_file_contents).to include('<h2>')
        expect(html_file_contents).to include('</h2>')
      end
    end

    context 'within <body>' do
      it 'contains <ul> tags to create an unordered list' do
        expect(html_file_contents).to include('<ul>')
        expect(html_file_contents).to include('</ul>')
      end
    end

    context 'within <body>' do
      it 'contains <ol> tags to create an ordered list' do
        expect(html_file_contents).to include('<ol>')
        expect(html_file_contents).to include('</ol>')
      end
    end

    context 'within <body>' do
      it 'contains <a> tags to create a link' do
        expect(html_file_contents).to include('<a href="')
        expect(html_file_contents).to include('</a>')
      end
    end

    context 'within <body>' do
      it 'contains <em> tags to format italicized text' do
        expect(html_file_contents).to include('<em>')
        expect(html_file_contents).to include('</em>')
      end
    end

      context 'within <body>' do
      it 'contains <strong> tags to format bolded text' do
        expect(html_file_contents).to include('<strong>')
        expect(html_file_contents).to include('</strong>')
      end
    end

    context 'within <body>' do
      it 'contains a <img> tag to embed an image' do
        expect(html_file_contents).to include('img')
      end
    end
  end

  context 'guest book' do
    it 'is a valid form' do
      guest_book = File.read('./guest_book.html')
      expect(guest_book).to include('<form')
      expect(guest_book).to include('</form>')
    end

    it 'contains labels' do
      guest_book = File.read('./guest_book.html')
      expect(guest_book).to include('<label')
      expect(guest_book).to include('</label>')
    end
  end

  context 'w3c validation' do
    it 'is a valid w3c document' do
      validator = W3CValidators::NuValidator.new
      html = File.read('./index.html')
      results = validator.validate_text(html)
      error_messages = "Expected a valid w3c document but got:\n#{results.errors.collect{|e| e.to_s}.join("\n")}"
      expect(results.errors).to be_empty, error_messages
    end
  end

  context 'within style.css' do
    it 'sets a "opening" paragraph class to be styled' do
      expect(css_file_contents).to include('.'), 'There is a missing paragraph "opening" class'
    end

    it 'sets a id to be styled' do
      expect(css_file_contents).to include('#'), 'There is a missing id styling'
    end
  end

end
