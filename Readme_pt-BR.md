# Correios SRO

*Looking for english documentation? [Read here](https://github.com/formaweb/correios-sro/blob/master/Readme.md).*

Sistema de rastreamento de objeto do Correios (Brasil).

## Instalação

Adicione esta linha no Gemfile da sua aplicação:

    gem 'correios-sro'

Em seguida, execute:

    $ bundle

Ou instale você mesmo com:

    $ gem install correios-sro

## Utilização

### Básica

```ruby
package = CorreiosSRO.track('SS987654321XX')

if package
  puts package.number
  package.status.each do |status|
    puts status.date
    puts status.place
    puts status.track
    puts status.details
  end
end
```

### Primeiro ou Último

```ruby
package = CorreiosSRO.track('SS987654321XX')

if package
  puts package.first.date
  puts package.last.date
end
```

## Contribuindo

1. Fork este repositório ( https://github.com/formaweb/correios-sro/fork )
2. Crie o seu branch de implementação (`git checkout -b my-new-feature`)
3. Commit suas alterações (`git commit -am 'Add some feature'`)
4. Push para o branch (`git push origin my-new-feature`)
5. Crie um novo Pull Request
