﻿/*
This file in the main entry point for defining Gulp tasks and using Gulp plugins.
Click here to learn more. http://go.microsoft.com/fwlink/?LinkId=518007
*/

var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync').create();
var autoprefixer = require('gulp-autoprefixer');

gulp.task('default', function () {
    // place code for your default task here
});

gulp.task('browserSync', function () {
    browserSync.init({
        proxy: "localhost:16553",
        open: false,
    })
})

gulp.task('sass', function () {
    return gulp.src(['./assets/sass/**/*.sass', './assets/sass/**/*.scss', '!./assets/sass/**/_*.*'])
      .pipe(sass())
      .pipe(autoprefixer({
          browsers: ['> 5%'],
          cascade: false
      }))
      .pipe(gulp.dest('./assets/css'))
      .pipe(browserSync.stream());
});


gulp.task('watch', ['browserSync', 'sass'], function () {
    gulp.watch(['./assets/sass/**/*.sass', './assets/sass/**/*.scss'],['sass']);
    //gulp.watch(['*.html','*.aspx'], browserSync.reload);
    //gulp.watch('./assets/js/*.js', browserSync.reload);
    // Other watchers
})