Content-Type: multipart/mixed; boundary="===============0733248422623349459=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [CRM114spam]: drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe() warn: 'res->start' not released on lines: 2412.
Date: Mon, 21 Sep 2020 12:20:29 +0300
Message-ID: <20200921092029.GU18329@kadam>
In-Reply-To: <20200920174954.GA25438@gallifrey>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0733248422623349459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2020 at 06:49:54PM +0100, Dr. David Alan Gilbert wrote:
> * Dan Carpenter (dan.carpenter(a)oracle.com) wrote:
> > b84bb5186297d1 drivers/hwmon/w83627ehf.c     Guenter Roeck          201=
1-02-13  2405  =

> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2406  	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->d=
ev,
> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2407  							 data->name,
> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2408  							 data,
> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2409  							 &w83627ehf_chip_info,
> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2410  							 w83627ehf_groups);
> > 08c79950a047db drivers/hwmon/w83627ehf.c     Rudolf Marek           200=
6-07-05  2411  =

> > 266cd5835947d0 drivers/hwmon/w83627ehf.c     Dr. David Alan Gilbert 201=
9-11-24  2412  	return PTR_ERR_OR_ZERO(hwmon_dev);
> >                                                                        =
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > This should be:
> > =

> > 	if (IS_ERR(hwmon_dev)) {
> > 		err =3D PTR_ERR(hwmon_dev);
> > 		goto exit_release;
> > 	}
> > =

> > 	return 0;
> =

> That looks about right to me; why don't you just submit that as a patch ?

These are automated emails sent from a bot.  I just look them over and
hit send.  A lot of the time they are for patches which aren't applied
to a git tree yet.

But in this case, sure I can send an email.  I looked at this one a bit
closely because it's a new warning that was only introduced last week.

regards,
dan carpenter

--===============0733248422623349459==--

