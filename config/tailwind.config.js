const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        darkpurple: '#300030',
        mediumpurple: '#480048',
        lightpurple: '#601848',
        creamwine: '#C04848',
        orangered: '#F07241',
        shark: {
          100: '#DCE3E6',
          300: '#A7D0E6',
          500: '#7DBADB',
          700: '#4A6E82',
          900: '#172329',
          50: '#F2F5F7',
          200: '#C2D4E0',
          400: '#8DB8D1',
          600: '#5A8C9F',
          800: '#274A5F',
          950: '#0D1C2A',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
