Content-Type: multipart/mixed; boundary="===============1721965736658563332=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Smatch indenting warnings?
Date: Mon, 02 Mar 2020 18:12:01 +0300
Message-ID: <20200302151201.GE4118@kadam>
In-Reply-To: <831EE4E5E37DCC428EB295A351E6624952413311@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1721965736658563332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 03:06:21PM +0000, Li, Philip wrote:
> > Subject: [kbuild] Smatch indenting warnings?
> > =

> > Smatch prints a lot of warnings about inconsistent indenting.
> > =

> > sound/soc/codecs/max98088.c:1746 max98088_i2c_probe() warn: inconsistent
> > indenting
> > sound/core/seq/oss/seq_oss_event.c:297 note_on_event() warn: inconsiste=
nt
> > indenting
> > sound/core/rawmidi.c:1882 alsa_rawmidi_init() warn: inconsistent indent=
ing
> > =

> > =

> > $ grep "inconsistent indenting" smatch_warns.txt | wc -l
> > 321
> > =

> > These are generally not bugs, but the check has a low false positive
> > ratio and it's all stuff which really should be fixed.  I seldom report
> > them but it would be nice if kbuild reported them automatically.
> Thanks Dan, we will handle this in this week to automatically send
> "inconsistent indenting" warn.

Awesome!  Thanks so much.

regards,
dan carpenter

--===============1721965736658563332==--

