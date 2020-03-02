Content-Type: multipart/mixed; boundary="===============2284108164344647067=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Smatch indenting warnings?
Date: Mon, 02 Mar 2020 15:49:42 +0300
Message-ID: <20200302124942.GD4118@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2284108164344647067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Smatch prints a lot of warnings about inconsistent indenting.

sound/soc/codecs/max98088.c:1746 max98088_i2c_probe() warn: inconsistent in=
denting
sound/core/seq/oss/seq_oss_event.c:297 note_on_event() warn: inconsistent i=
ndenting
sound/core/rawmidi.c:1882 alsa_rawmidi_init() warn: inconsistent indenting


$ grep "inconsistent indenting" smatch_warns.txt | wc -l
321

These are generally not bugs, but the check has a low false positive
ratio and it's all stuff which really should be fixed.  I seldom report
them but it would be nice if kbuild reported them automatically.

regards,
dan carpenter
--===============2284108164344647067==--

