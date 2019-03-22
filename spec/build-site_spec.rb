RSpec.describe "HTML Exam" do
  it 'begins with a valid doctype' do
    expect(parsed_html.children.first).to be_html5_dtd, 'There is a missing valid doctype tag'
  end

  it 'has a top-level <html> tag to enclose the document' do
    expect(parsed_html.child.name).to match(/html/i)
    expect(html_file_contents).to include('<html>'), 'There is a missing opening html tag'
    expect(html_file_contents).to include('</html>'), 'There is a missing closing html tag'
  end

  context 'within <html>' do
    it 'contains a <head> tag to enclose the header' do
      head = parsed_html.search('html > head').first
      expect(head.name).to eq('head')
      expect(html_file_contents).to include('</head>'), 'There is a missing head tag'
    end

    context 'within <head>' do
      it 'contains a <title> tag to enclose the site title' do
        title = parsed_html.search('html > head > title').first
        expect(title.name).to eq('title')
        expect(html_file_contents).to include('</title>'), 'There is a missing title tag'
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
      expect(html_file_contents).to include('</body>'), 'There is a missing opening body tag'
    end

    context 'within <body>' do
      it 'contains <header> tags to create a header section' do
        expect(html_file_contents).to include('<header>'), 'There is a missing opening header tag'
        expect(html_file_contents).to include('</header>'), 'There is a missing closing header tag'
      end
    end

    context 'within <body>' do
      it 'contains <nav> tags to create a nav section' do
        expect(html_file_contents).to include('<nav>'), 'There is a missing opening nav tag'
        expect(html_file_contents).to include('</nav>'), 'There is a missing closing nav tag'
      end
    end

    context 'within <body>' do
      it 'contains <section> tags to create a section' do
        expect(html_file_contents).to include('<section'), 'There is a missing opening section tag'
        expect(html_file_contents).to include('</section>'), 'There is a missing closing section tag'
      end
    end

    context 'within <body>' do
      it 'contains an id attribute to identify a section' do
        expect(html_file_contents).to include('<section id='), 'There is a missing opening section id tag'
      end
    end

    context 'within <body>' do
      it 'contains <h1> tags to create a first-level heading' do
        expect(html_file_contents).to include('<h1>'), 'There is a missing opening h1 tag'
        expect(html_file_contents).to include('</h1>'), 'There is a missing closing h1 tag'
      end
    end

    context 'within <body>' do
      it 'contains <h2> tags to create a second-level heading' do
        expect(html_file_contents).to include('<h2>'), 'There is a missing opening h2 tag'
        expect(html_file_contents).to include('</h2>'), 'There is a missing closing h2 tag'
      end
    end

    context 'within <body>' do
      it 'contains <ul> tags to create an unordered list' do
        expect(html_file_contents).to include('<ul>'), 'There is a missing opening unordered list tag'
        expect(html_file_contents).to include('</ul>'), 'There is a missing closing unordered list tag'
      end
    end

    context 'within <body>' do
      it 'contains <ol> tags to create an ordered list' do
        expect(html_file_contents).to include('<ol>'), 'There is a missing opening ordered list tag'
        expect(html_file_contents).to include('</ol>'), 'There is a missing closing ordered list tag'
      end
    end

    context 'within <body>' do
      it 'contains <a> tags to create a link' do
        expect(html_file_contents).to include('<a href="'), 'There is a missing opening link tag'
        expect(html_file_contents).to include('</a>'), 'There is a missing closing link tag'
      end
    end

    context 'within <body>' do
      it 'contains <em> tags to format italicized text' do
        expect(html_file_contents).to include('<em>'), 'There is a missing opening em tag'
        expect(html_file_contents).to include('</em>'), 'There is a missing closing em tag'
      end
    end

      context 'within <body>' do
      it 'contains <strong> tags to format bolded text' do
        expect(html_file_contents).to include('<strong>'), 'There is a missing opening strong tag'
        expect(html_file_contents).to include('</strong>'), 'There is a missing closing strong tag'
      end
    end

    context 'within <body>' do
      it 'contains a <img> tag to embed an image' do
        expect(html_file_contents).to include('img'), 'There is a missing image tag'
      end
    end
  end

  context 'guest book' do
    it 'is a valid form' do
      guest_book = File.read('./guest_book.html')
      expect(guest_book).to include('<form'), 'There is a missing opening form tag'
      expect(guest_book).to include('</form>'), 'There is a missing opening form tag'
    end

    it 'contains labels' do
      guest_book = File.read('./guest_book.html')
      expect(guest_book).to include('<label'), 'There is a missing opening label tag'
      expect(guest_book).to include('</label>'), 'There is a missing closing label tag'
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
