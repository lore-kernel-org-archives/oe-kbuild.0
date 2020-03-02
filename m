Content-Type: multipart/mixed; boundary="===============7918583092895289947=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
Subject: Re: Smatch indenting warnings?
Date: Mon, 02 Mar 2020 15:06:21 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E6624952413311@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20200302124942.GD4118@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7918583092895289947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild] Smatch indenting warnings?
> =

> Smatch prints a lot of warnings about inconsistent indenting.
> =

> sound/soc/codecs/max98088.c:1746 max98088_i2c_probe() warn: inconsistent
> indenting
> sound/core/seq/oss/seq_oss_event.c:297 note_on_event() warn: inconsistent
> indenting
> sound/core/rawmidi.c:1882 alsa_rawmidi_init() warn: inconsistent indenting
> =

> =

> $ grep "inconsistent indenting" smatch_warns.txt | wc -l
> 321
> =

> These are generally not bugs, but the check has a low false positive
> ratio and it's all stuff which really should be fixed.  I seldom report
> them but it would be nice if kbuild reported them automatically.
Thanks Dan, we will handle this in this week to automatically send
"inconsistent indenting" warn.

> =

> regards,
> dan carpenter
> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============7918583092895289947==--

