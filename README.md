- Ruby 3.0.1
- Rails 6.1.4

### Development decisions

**Devise gem**
- For user registration/authentication
- Why reinvent the wheel?
- Very popular Ruby gem

**Shortener gem**
- To generate the shortened URLs
- Why reinvent the wheel?
- Activly maintained gem with updates for Rails 6 support

### Code Style

```yml
Style/Documentation:
  Enabled: false
```
Code should be self-documenting.

### TODO
- Internationalise (I18n)
- CSS styling (Tailwind)
