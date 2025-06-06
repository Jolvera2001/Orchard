// tailwind.config.js
module.exports = {
    content: [
        './views/**/*.haml',
        './app.rb',
    ],
    theme: {
        extend: {
            colors: {
                'brand-blue': '#1e40af',
            }
        },
    },
    plugins: [],
}