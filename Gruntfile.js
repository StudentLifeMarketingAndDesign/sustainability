module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({

		pkg: grunt.file.readJSON('package.json'),

		/**
		* Set project object
		*/
		project: {
			src: 'themes/sustainability',
			scss: ['<%= project.src %>/scss'],
			css: ['<%= project.src %>/css'],
			js: ['<%= project.src %>/js']
		},

		concat: {
			dist: {
				src: [
					'<%= project.src %>/js/plugins/*.js',
					'<%= project.src %>/js/main.js'
				],
				dest: '<%= project.src %>/js/build/production.js'
			}
		},

		uglify: {
			build: {
				src: ['<%= project.src %>/js/build/production.js'],
				dest: '<%= project.src %>/js/build/production.min.js'
			}
		},

		sass: {
			dist: {
				options: {
					style: 'compressed'
				},
				files: {
					'<%= project.src %>/css/master.css': '<%= project.src %>/scss/master.scss',
					'<%= project.src %>/css/editor.css': '<%= project.src %>/scss/editor.scss'
				}
			}
		},

		imagemin: {
			dynamic: {
				files: [{
					expand: true,
					cwd: '<%= project.src %>/images/',
					src: ['**/*.{png,jpg,gif}'],
					dest: '<%= project.src %>/images/'
				}]
			}
		},

		watch: {
			options: {
				livereload: true,
			},
			scripts: {
				files: ['<%= project.src %>/js/*.js', '<%= project.src %>/js/**/*.js'],
				tasks: ['concat', 'uglify'],
				options: {
					spawn: false,
				}
			},
			css: {
				files: ['<%= project.src %>/scss/*.scss', '<%= project.src %>/scss/**/*.scss'],
				tasks: ['sass'],
				options: {
					spawn: false,
				}
			},
			markup: {
					files: ['<%= project.src %>/templates/**/*.ss'],
					options: {
							livereload: true,
					}
			}
		},

	});

	// Load the plugin that provides the "uglify" task.
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	grunt.loadNpmTasks('grunt-contrib-watch');

	// Default task(s).
	grunt.registerTask('default', ['concat', 'uglify', 'sass', 'watch']);

};