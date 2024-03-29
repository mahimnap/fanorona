## Fanorona Game
1. `bundle install --path vendor/bundle`
    - optional: experience great pain because this took upwards of 20 minutes
2. `rails webpacker:install`
    - optional: experience tremendous pain because this took FIFTY-FIVE MINUTES
        TO COMPLETE (your mileage may (hopefully) vary)
3. To run the server for a short amount of time, run `rails server -p 33080 -b 
    0.0.0.0`
    - To run long term (like when we turn in), run `rails server -d -p 33080 -b
        0.0.0.0` to run the server in daemon mode.
    - our port number is `33080`

### Killing a server when it's already running on cis3260.socs.uoguelph.ca:33080
- useful when you launched the server in daemon mode, or lost the terminal which
    launched the server so you can't ctrl-c
0. You almost certainly need to be the user that launched the server
1. cd into the project directory.
2. run `kill -2 $(echo $(cat tmp/pids/server.pid))`
    - if you did not launch the server, you can try this:
    1. run `ps aux` to get a list of processes
    2. try to find the entry that contains `puma 5.6.5 (tcp://0.0.0.0:33080)`, for example:
    ```
    acoope07 10110  0.5  0.2 373176 67968 ?        Sl   15:45   0:00 puma 5.6.5 (tcp://0.0.0.0:33080) [/]
    ```
    3. run `kill -2 <pid>` where pid is the second column in the `ps aux` table.
        For the example above, I would run `kill -2 10110`
    - BE VERY CAREFUL: if you run this command with the wrong PID and it works,
        you're probably sabotaging an other student!
    - again, kinda doubt it'll work, but can't hurt to try
## Running On Windows
0. Make sure you've installed Ruby, Rails (`gem install rails`), Node.js 
    v16.17.0 (IT IS VERY IMPORTANT YOU USE THIS VERSION OF NODE, BIG PAIN HAPPEN
    OTHERWISE), yarn (`npm install --global yarn` after installing node.js)
1. Attempt to run `rails server`. You'll get something like `Your Ruby version
    is 3.1.2, but your Gemfile specified 2.5.5`
    - Open Gemfile, and replace `ruby 2.5.5` with `ruby <your ruby version,
        3.1.2 in the example above>`
    - While you're here, scroll to the bottom of the Gemfile and replace 
        ```
        gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
        ```
        with
        ```
        gem 'tzinfo-data'
        ```
2. Run `bundle install --path vendor/bundle`
3. Run `rails webpacker:install`
4. Run `rails server`
5. IMPORTANT: Don't commit any of the changes that you made above, it might mess with stuff
    on the socs server.
    - also don't commit any of the generated files.