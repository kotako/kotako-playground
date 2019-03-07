package main

import (
	"fmt"
	"log"
	"os"

	"github.com/urfave/cli"
)

func app() *cli.App {
	app := cli.NewApp()
	app.Name = "sample"
	app.Usage = "for test cli app"

	app.Commands = []cli.Command {
		{
			Name:    "arguments",
			Aliases: []string{"a"},
			Usage:   "echo arguments",
			Action:  func(c *cli.Context) error {
				fmt.Printf("%s", c.Args().First())
				return nil
			},
		},
	}

	return app
}

func main() {
	err := app().Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
