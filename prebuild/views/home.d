module yurai.prebuild.views.view_home;

import yurai;

import models;

public final class view_home : View
{
  public:
  
  final:
  this(IHttpRequest request, IHttpResponse response)
  {
    super("home", request,response, [`/`,`index`]);
  }

  override ViewResult generate(bool processLayout)
  {
    

    return generateFinal(processLayout);
  }
  ViewResult generateModel()
  {
    
    return generateFinal(true);
  }
  override ViewResult generateFinal(bool processLayout)
  {
    setPlaceholder(`title`, `Home`);
    setSection(`outside`);
append(`

<div class="cover">
  <div class="container-fluid py-5">
    <h1 class="display-5 fw-bold header">Fast, powerful &amp; native</h1>
    <p class="col-md-12 fs-4 message"><span>Yurai</span> is an innovative full-stack web-framework written in the <a href="https://dlang.org/">D programming language</a>.</p>
    <a class="btn btn-info btn-lg" href="/downloads" role="button">Get Started</a> <a class="btn btn-dark btn-lg" href="/donate" role="button">Support <i class="fad fa-hands-heart"></i></a>
  </div>
</div>

`);
setSection(`*`);
append(`

<div class="row base-content top-content">
  <div class="col-md-6 cold-sm-12 introduction-container">
    <h2>Experience the web with Yurai</h2>
    <p>
      <b>Yurai</b> is built on modern principles using <b>D</b>, inspired by <b>ASP.NET Core</b> and razor templates.<br>
      <br>
      It's completely free, open-source and fit for enterprise development with focus on rapid development, performance and the cloud.<br>
      <br>
      It compiles natively but dynamically, and can run on most platforms and environments.<br>
      <br>
      The goal of Yurai is to provide an environment fit for both enterprise projects and personal hobby projects.<br>
      <br>
      Yurai also values safety and security and you'll find most security measures working out of the box with little to no effort on your part!<br>
      <br>
      Get started with the <a href="/downloads">Latest stable version</a> of Yurai.
    </p>
  </div>
  <div class="col-md-6 cold-sm-12 order-md-2 examples-container">
    `);
void createTab(string tabText, bool isSelected) {
auto tabId = "examples_" ~ tabText.replace(" ", "_").strip.toLower;
append(`      <li class="nav-item" role="presentation">
        <button class="nav-link `);
append((isSelected ? " active" : ""));
append(`" id="`);
append(tabId);
append(`_tab" data-bs-toggle="tab" data-bs-target="#`);
append(tabId);
append(`" type="button" role="tab" aria-controls="`);
append(tabId);
append(`" aria-selected="`);
append((isSelected ? "true" : "false"));
append(`">
          `);
append(tabText);
append(`
        </button>
      </li>
    `);
}
renderPartial(`codehighlight`);
append(`

    `);
string getExampleLayout(string name) {
      auto docPath = "home_examples/" ~ name ~ ".md";

      string html;
      if (exists(docPath)) {
        import vibe.textfilter.markdown;

        html = filterMarkdown(readText(docPath), MarkdownFlags.backtickCodeBlocks | MarkdownFlags.tables);
      }
      else
      {
        html = "Missing example: " ~ name;
      }

      return html;
    }
append(`

    <div class="examples">
      <div>
        <h2>Examples</h2>
      </div>
      <div>
        <ul class="nav nav-tabs"  id="examples_tab" role="tablist">
          `);
createTab("Layouts", true);
createTab("Views", false);
createTab("View Controllers", false);
createTab("Api Controllers", false);
createTab("ORM", false);
append(`        </ul>
        <div class="tab-content">
          <div class="example-content tab-pane fade show active" id="examples_layouts" role="tabpanel" aria-labelledby="examples_layouts">
            `);
append(getExampleLayout("layouts"));
append(`
          </div>
          <div class="example-content tab-pane fade" id="examples_views" role="tabpanel" aria-labelledby="examples_views">
            `);
append(getExampleLayout("views"));
append(`
          </div>
          <div class="example-content tab-pane fade" id="examples_view_controllers" role="tabpanel" aria-labelledby="examples_view_controllers">
            `);
append(getExampleLayout("viewcontrollers"));
append(`
          </div>
          <div class="example-content tab-pane fade" id="examples_api_controllers" role="tabpanel" aria-labelledby="examples_api_controllers">
            `);
append(getExampleLayout("apicontrollers"));
append(`
          </div>
          <div class="example-content tab-pane fade" id="examples_orm" role="tabpanel" aria-labelledby="examples_orm">
            `);
append(getExampleLayout("orm"));
append(`
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="why-container base-content">
  <div class="why-header">
    <h2>Why Yura?</h2>
  </div>
  <div class="why-content">
    <div class="accordion" id="whyaccordion">
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-1">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
            High Performance
          </button>
        </h2>
        <div id="collapse-1" class="accordion-collapse collapse show" aria-labelledby="item-1" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Experience speed and low memory-usage
            </p>
            <div class="accordion-text">
              Yurai is built to handle many connections, to be fast and with absolute excellent performance.<br>
              <br>
              It's one of Yurai's main priorities; to deliver content and data fast!<br>
              <br>
              Yurai's performance is also combined with low-memory-usage compared to many other frameworks.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-2">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
            Control &amp; Flexibility
          </button>
        </h2>
        <div id="collapse-2" class="accordion-collapse collapse" aria-labelledby="item-2" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              You control setup, configurations, development and deployment
            </p>
            <div class="accordion-text">
              Everything in Yurai can be controlled by you.<br>
              <br>
              That means you can configure Yurai to operate exactly how you want it.<br>
              <br>
              This allows Yurai to be integrated on top of existing solutions or as a part of an already established environment.<br>
              <br>
              Yurai is flexible and can work with any type of data and deliver any type of content.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-3">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
            Fast Development Pace
          </button>
        </h2>
        <div id="collapse-3" class="accordion-collapse collapse" aria-labelledby="item-3" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Experience rapid development like never before
            </p>
            <div class="accordion-text">
              The infrastructure of Yurai was made to support rapid development, even for enterprise solutions.<br>
              <br>
              Yurai's API is user-friendly and feature-rich, making sure you only have to write absolute minimum functionality and can focus on getting the job done.<br>
              <br>
              It supports all modern functionality, along with many other out of the box and built-in features that other frameworks don't, or at least not without effort or third-party libraries.<br>
              <br>
              With Yurai you can keep your dependencies as low as possible, keeping your environment and workspace safe from breakage.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-4">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-4" aria-expanded="false" aria-controls="collapse-4">
            Scalability
          </button>
        </h2>
        <div id="collapse-4" class="accordion-collapse collapse" aria-labelledby="item-4" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Scaling your application has never been easier
            </p>
            <div class="accordion-text">
              Being able to scale environments and applications is an essential functionality for enterprise solutions.<br>
              <br>
              Yurai was developed in a way to support scalability without a complex environment.<br>
              <br>
              You can scale it as much or as little as you need or want.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-5">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-5" aria-expanded="false" aria-controls="collapse-5">
            Security
          </button>
        </h2>
        <div id="collapse-5" class="accordion-collapse collapse" aria-labelledby="item-5" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Security is a priorty and Yurai builds on that
            </p>
            <div class="accordion-text">
              Today security is an absolute priority for professional solutions.<br>
              <br>
              Security is not only protecting your data, server and platform from attacks, but also being secure from coding errors and bugs.<br>
              <br>
              Yurai supports all modern security practices and one of its goals is to be OWASP Compliant.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-6">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-6" aria-expanded="false" aria-controls="collapse-6">
            Cross Platform Support
          </button>
        </h2>
        <div id="collapse-6" class="accordion-collapse collapse" aria-labelledby="item-6" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Run Yurai on multiple platforms and within multiple environments
            </p>
            <div class="accordion-text">
              Unlike some other web-frameworks, then Yurai isn't limited to just one or few platforms and environments.<br>
              <br>
              Yurai supports multiple operating systems and environments, including cloud environments.<br>
              <br>

              <div class="table-responsive-content"><table class="table">
                <thead>
                  <tr>
                    <th scope="col">Operating Systems</th>
                    <th scope="col">Environments</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Windows</td>
                    <td>Microsoft Azure</td>
                  </tr>
                  <tr>
                    <td>Unix / Linux / Posix</td>
                    <td>Heroku</td>
                  </tr>
                  <tr>
                    <td>macOS</td>
                    <td>Nginx</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>Apache</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>Amazon Web Services</td>
                  </tr>
                </tbody>
              </table></div>
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-7">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-7" aria-expanded="false" aria-controls="collapse-7">
            Test-Driven Development
          </button>
        </h2>
        <div id="collapse-7" class="accordion-collapse collapse" aria-labelledby="item-7" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Testing is essential for professional solutions
            </p>
            <div class="accordion-text">
              Yurai has support for D's built-in unittesting, but also has a more advanced unittesting API.<br>
              <br>
              Yurai's own unittesting API can be shaped to test certain requests and target specific areas of the application.<br>
              <br>
              This is useful, because you can do real HTTP tests without a browser or third-party tools.
            </div>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header" id="item-8">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-8" aria-expanded="false" aria-controls="collapse-8">
            Database Support
          </button>
        </h2>
        <div id="collapse-8" class="accordion-collapse collapse" aria-labelledby="item-8" data-bs-parent="#whyaccordion">
          <div class="accordion-body">
            <p class="accordion-breadcrumb">
              Wide range of Sql & No-sql database support
            </p>
            <div class="accordion-text">
              Software often use more than one type of database and thus it was a priority for Yurai to support that.<br>
              <br>
              Yurai supports both no-sql and sql databases.<br>
              <br>

              <div class="table-responsive-content"><table class="table">
                <thead>
                  <tr>
                    <th scope="col">Database</th>
                    <th scope="col">Built-in Wrapper?</th>
                    <th scope="col">Third-Party?</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>MySQL</td>
                    <td>Yes</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>MariaDB</td>
                    <td>Yes</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>PostgreSQL</td>
                    <td>Future support*</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>Microsoft SQL Server</td>
                    <td>Future support*</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>SQLite</td>
                    <td>Future support*</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>MongoDB</td>
                    <td>Yes</td>
                    <td>Yes</td>
                  </tr>
                  <tr>
                    <td>Redis</td>
                    <td>Future support*</td>
                    <td>Yes</td>
                  </tr>
                </tbody>
              </table></div>

              <br>

              <span class="base-note">* All future support databases can currently be used using third party libraries and tools but has no built-in wrapper.</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="vibed-versus-table base-content">
  <h2>Yurai <span class="bold-content">VS</span> Diet Templates (vibe.d) &amp; Razor (ASP.NET Core)</h2>

  <div class="versus-header">
    <p>
      Below is a table comparison of Yurai templates and vibe.d (diet) templates.<br>
      <br>
      The comparison serves the purpose of showcasing that Yurai's template engine has an advantage to vibe.d's default template engine.<br>
      <br>
      Since Yurai uses vibe.d as the default web-server then one might think Diet templates are necessary.<br>
      <br>
      However, Yurai does not depend on any web-server implementations for more than handling connections.<br>
      <br>
      That's why Yurai has its own template engine with its own syntax.<br>
      <br>
      Yurai aims to be similar to ASP.NET Core in development practice and thus the template engine is HTML-first, which is the largest difference between Diet templates and Yurai templates.
    </p>
  </div>
  <div class="versus-table">
    <div class="table-responsive-content"><table class="table">
      <thead>
        <tr>
          <th scope="col">Functionality</th>
          <th scope="col">Diet</th>
          <th scope="col">Yurai</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Compile-time parsing</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Linear Expressions</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>D Code</td>
          <td>
            Yes (Partially)<br>
            <br>
            Does not use fully D syntax.
          </td>
          <td>
            Yes<br>
            <br>
            Full D expressions and code blocks with D syntax.
          </td>
        </tr>
        <tr>
          <td>Layouts / Extendable Views</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Partial Views</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Non-layout View Limitations</td>
          <td>
            Yes<br>
            <br>
            You can only use <b>-block</b>
          </td>
          <td>No</td>
        </tr>
        <tr>
          <td>Metadata Configurations</td>
          <td>Yes (Limited)</td>
          <td>Yes (Very Functional)</td>
        </tr>
        <tr>
          <td>Expressive Grammar</td>
          <td>
            No<br>
            <br>
            Uses keywords for identifying view parts.
          </td>
          <td>
            Yes<br>
            <br>
            Lots of syntactic sugar that helps creating expressive views.
          </td>
        </tr>
        <tr>
          <td>Custom Grammar</td>
          <td>No</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Caching</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Dynamic HTML Generation</td>
          <td>Yes</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Dynamic CSS Generation</td>
          <td>Unknown</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Dynamic Any-type Generation</td>
          <td>Unknown</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Standard HTML</td>
          <td>
            No<br>
            <br>
            You must use the Diet syntax.
          </td>
          <td>
            Yes<br>
            <br>
            Allows mixture between Yurai expressions and standard HTML.<br>
            <br>
            However there's a full HTML compliance.
          </td>
        </tr>
        <tr>
          <td>Placeholders</td>
          <td>No</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>MVC</td>
          <td>No</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>HMVC</td>
          <td>No</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>View Inheritance</td>
          <td>No</td>
          <td>Yes</td>
        </tr>
        <tr>
          <td>Static Templates</td>
          <td>Yes</td>
          <td>
            Yes<br>
            <br>
            Supports dynamic content and statically-timed caching.
          </td>
        </tr>
        <tr>
          <td>Sections</td>
          <td>No</td>
          <td>
            Yes<br>
            <br>
            You can render specific sections of views, as well pass sections to layouts.
          </td>
        </tr>
        <tr>
          <td><b>Total Score*</b></td>
          <td><b>9(11)/20</b></td>
          <td><b>20/20</b></td>
        </tr>
      </tbody>
    </table></div>

    <br>

    <span class="base-note">* A higher score is better.</span>

    <br><br>

    <ul class="nav nav-tabs"  id="comparison_tab" role="tablist">
      `);
createTab("Diet", true);
createTab("Yurai", false);
append(`    </ul>
    <div class="tab-content">
      <div class="example-content tab-pane fade show active" id="examples_diet" role="tabpanel" aria-labelledby="examples_diet">
        `);
append(getExampleLayout("diet"));
append(`
      </div>
      <div class="example-content tab-pane fade" id="examples_yurai" role="tabpanel" aria-labelledby="examples_yurai">
        `);
append(getExampleLayout("yurai"));
append(`
      </div>
    </div>

    <p class="base-note">
      While Diet templates look shorter, they don't offer the same flexibility and will in turn become more complex with larger projects.<br>
      <br>
      They also rely heavily on indentation and since they aren't html-first then it can be hard to use them with frameworks like bootstrap or just html5 themes/templates in general.<br>
      <br>
      Yurai templates has been heavily inspired by <a href="https://docs.microsoft.com/en-us/aspnet/core/mvc/views/razor?view=aspnetcore-5.0" target="_blank" rel="noopener noreferrer">razor templates</a> from ASP.NET Core, but are much more flexible and has a slight syntactic difference.
    </p>

    <br>

    `);
append(readText("home_examples/razortable.html"));
append(`

    <br>

    <div>
      Learn more about Yurai <a href="/docs/specifications/views">views &amp; templates</a>.
    </div>

  </div>
</div>
`);

    

    return finalizeContent(`layout`,processLayout);
  }
}
