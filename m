Content-Type: multipart/mixed; boundary="===============6761243588907564467=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 2736/10638] drivers/net/can/usb/peak_usb/pcan_usb.c:523 pcan_usb_decode_error() error: we previously assumed 'cf' could be null (see line 503)
Date: Fri, 27 Aug 2021 12:54:37 +0300
Message-ID: <20210827095437.GJ7722@kadam>
In-Reply-To: <20210827092040.6m6khy4e7eay5qvu@pengutronix.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6761243588907564467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yeah...

Thanks for looking at this.  I should have caught it myself, because I
should have wondered why I hadn't sent a warning for this earlier from
my own test system.

The kbuild-bot doesn't do cross function analysis.  (It adds
hours and hours to the build).  When I build this on my system with
the cross function DB then Smatch parses it correctly.

On Fri, Aug 27, 2021 at 11:20:40AM +0200, Marc Kleine-Budde wrote:
> > 1c0ee046957648 Marc Kleine-Budde 2015-07-11  524  	netif_rx(skb);
> > 46be265d338833 Stephane Grosjean 2012-03-02  525  =

> > 46be265d338833 Stephane Grosjean 2012-03-02  526  	return 0;
> > 46be265d338833 Stephane Grosjean 2012-03-02  527  }
> =

> This pattern exists in probably more than one driver.
> =

> Should we extend the NULL pointer check to "cf", to make smatch happy?

My philosophy is always that we shouldn't add code just to make the
checker happy.

This is a complicated one because it requires cross function analysis.
When you built the smatch cross function DB, it parses every file and
outputs SQL to describe what the function does.  Then you pipe the SQL
to sqlite3 which takes a few hours just because the DB is so huge (20GB).

Smatch also parses some functions inline in an in-memory database but
that can't work here because alloc_can_err_skb() is in a different .c
file.

I imagine that in a couple years, the first step of a Smatch run will be
to slurp every function into a database raw so that they can be parsed
inline.  That would be a lot faster.

regards,
dan carpenter
--===============6761243588907564467==--

