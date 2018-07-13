ansi() {
  end="$2"
  printf "\033[${1}m" # Color start
  shift 2
  if [ $# = 0 ]
  then
    cat
  else
    for i
    do
      printf "$i"
    done
  fi
  printf "\033[${end}m" # Color end
}

reset() { ansi 0 0 "$@"; }
bold() { ansi 1 22 "$@"; }
dim() { ansi 2 22 "$@"; }
italic() { ansi 3 23 "$@"; }
underline() { ansi 4 24 "$@"; }
inverse() { ansi 7 27 "$@"; }
hidden() { ansi 8 28 "$@"; }
strikethrough() { ansi 9 29 "$@"; }
black() { ansi 30 39 "$@"; }
red() { ansi 31 39 "$@"; }
green() { ansi 32 39 "$@"; }
yellow() { ansi 33 39 "$@"; }
blue() { ansi 34 39 "$@"; }
magenta() { ansi 35 39 "$@"; }
cyan() { ansi 36 39 "$@"; }
white() { ansi 37 39 "$@"; }
gray() { ansi 90 39 "$@"; }
red_bright() { ansi 91 39 "$@"; }
green_bright() { ansi 92 39 "$@"; }
yellow_bright() { ansi 93 39 "$@"; }
blue_bright() { ansi 94 39 "$@"; }
magenta_bright() { ansi 95 39 "$@"; }
cyan_bright() { ansi 96 39 "$@"; }
white_bright() { ansi 97 39 "$@"; }
bg_black() { ansi 40 49 "$@"; }
bg_red() { ansi 41 49 "$@"; }
bg_green() { ansi 42 49 "$@"; }
bg_yellow() { ansi 43 49 "$@"; }
bg_blue() { ansi 44 49 "$@"; }
bg_magenta() { ansi 45 49 "$@"; }
bg_cyan() { ansi 46 49 "$@"; }
bg_white() { ansi 47 49 "$@"; }
bg_black_bright() { ansi 100 49 "$@"; }
bg_red_bright() { ansi 101 49 "$@"; }
bg_green_bright() { ansi 102 49 "$@"; }
bg_yellow_bright() { ansi 103 49 "$@"; }
bg_blue_bright() { ansi 104 49 "$@"; }
bg_magenta_bright() { ansi 105 49 "$@"; }
bg_cyan_bright() { ansi 106 49 "$@"; }
bg_white_bright() { ansi 107 49 "$@"; }

bold_black() { black "$@" | bold; }
bold_red() { red "$@" | bold; }
bold_green() { green "$@" | bold; }
bold_yellow() { yellow "$@" | bold; }
bold_blue() { blue "$@" | bold; }
bold_magenta() { magenta "$@" | bold; }
bold_cyan() { cyan "$@" | bold; }
bold_white() { white "$@" | bold; }
bold_gray() { gray "$@" | bold; }
bold_red_bright() { red_bright "$@" | bold; }
bold_green_bright() { green_bright "$@" | bold; }
bold_yellow_bright() { yellow_bright "$@" | bold; }
bold_blue_bright() { blue_bright "$@" | bold; }
bold_magenta_bright() { magenta_bright "$@" | bold; }
bold_cyan_bright() { cyan_bright "$@" | bold; }
bold_white_bright() { white_bright "$@" | bold; }

dim_black() { black "$@" | dim; }
dim_red() { red "$@" | dim; }
dim_green() { green "$@" | dim; }
dim_yellow() { yellow "$@" | dim; }
dim_blue() { blue "$@" | dim; }
dim_magenta() { magenta "$@" | dim; }
dim_cyan() { cyan "$@" | dim; }
dim_white() { white "$@" | dim; }
dim_gray() { gray "$@" | dim; }
dim_red_bright() { red_bright "$@" | dim; }
dim_green_bright() { green_bright "$@" | dim; }
dim_yellow_bright() { yellow_bright "$@" | dim; }
dim_blue_bright() { blue_bright "$@" | dim; }
dim_magenta_bright() { magenta_bright "$@" | dim; }
dim_cyan_bright() { cyan_bright "$@" | dim; }
dim_white_bright() { white_bright "$@" | dim; }

inverse_black() { black "$@" | inverse; }
inverse_red() { red "$@" | inverse; }
inverse_green() { green "$@" | inverse; }
inverse_yellow() { yellow "$@" | inverse; }
inverse_blue() { blue "$@" | inverse; }
inverse_magenta() { magenta "$@" | inverse; }
inverse_cyan() { cyan "$@" | inverse; }
inverse_white() { white "$@" | inverse; }
inverse_gray() { gray "$@" | inverse; }
inverse_red_bright() { red_bright "$@" | inverse; }
inverse_green_bright() { green_bright "$@" | inverse; }
inverse_yellow_bright() { yellow_bright "$@" | inverse; }
inverse_blue_bright() { blue_bright "$@" | inverse; }
inverse_magenta_bright() { magenta_bright "$@" | inverse; }
inverse_cyan_bright() { cyan_bright "$@" | inverse; }
inverse_white_bright() { white_bright "$@" | dim; }

underline_black() { black "$@" | underline; }
underline_red() { red "$@" | underline; }
underline_green() { green "$@" | underline; }
underline_yellow() { yellow "$@" | underline; }
underline_blue() { blue "$@" | underline; }
underline_magenta() { magenta "$@" | underline; }
underline_cyan() { cyan "$@" | underline; }
underline_white() { white "$@" | underline; }
underline_gray() { gray "$@" | underline; }
underline_red_bright() { red_bright "$@" | underline; }
underline_green_bright() { green_bright "$@" | underline; }
underline_yellow_bright() { yellow_bright "$@" | underline; }
underline_blue_bright() { blue_bright "$@" | underline; }
underline_magenta_bright() { magenta_bright "$@" | underline; }
underline_cyan_bright() { cyan_bright "$@" | underline; }
underline_white_bright() { white_bright "$@" | underline; }
