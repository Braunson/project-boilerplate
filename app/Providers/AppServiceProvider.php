<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
	/**
	 * Bootstrap any application services.
	 *
	 * @return void
	 */
	public function boot()
	{
		//
	}

	/**
	 * Register any application services.
	 *
	 * @return void
	 */
	public function register()
	{
		/**
		 * Register the service providers as long as the env is not production
		 */
		if ($this->app->environment() !== 'production') {
			$this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
			$this->app->register(\Themsaid\MailPreview\MailPreviewServiceProvider::class);
			$this->app->register(\Laracasts\Generators\GeneratorsServiceProvider::class);
			$this->app->register(\GrahamCampbell\Exceptions\ExceptionsServiceProvider::class);
		}
	}
}
