Content-Type: multipart/mixed; boundary="===============2688919592595343495=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/accessibility/speakup/speakup_audptr.c:138:20: warning: Array index 'test' is used before limits check.
Date: Thu, 28 Jan 2021 22:00:13 +0300
Message-ID: <20210128190013.GV20820@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2688919592595343495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   76c057c84d286140c6c416c3b4ba832cd1d8984e
commit: 2067fd92d75b6d9085a43caf050bca5d88c491b8 staging/speakup: Move out =
of staging
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/accessibility/speakup/speakup_audptr.c:138:20: warning: Array in=
dex 'test' is used before limits check. [arrayIndexThenCheck]
     } while (synth_id[test] !=3D 'n' && test < 32);
                      ^

vim +/test +138 drivers/accessibility/speakup/speakup_audptr.c

c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  127  static void synth_version(struct spk_synth *synth)
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  128  {
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  129  	unsigned char test =3D 0;

"test" is a weird name for an index, and the type should be int.

c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  130  	char synth_id[40] =3D "";
                                                                           =
             ^^^^^^^^^^^^^^^^^^^^^^^

8e69a811068657 drivers/staging/speakup/speakup_audptr.c Domagoj Trsan 2014-=
09-09  131  =

98c1fda752b604 drivers/staging/speakup/speakup_audptr.c Okash Khawaja 2017-=
03-16  132  	synth->synth_immediate(synth, "\x05[Q]");
ca693dcd5c0264 drivers/staging/speakup/speakup_audptr.c Okash Khawaja 2017-=
04-29  133  	synth_id[test] =3D synth->io_ops->synth_in();
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  134  	if (synth_id[test] =3D=3D 'A') {
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  135  		do {
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  136  			/* read version string from synth */
ca693dcd5c0264 drivers/staging/speakup/speakup_audptr.c Okash Khawaja 2017-=
04-29  137  			synth_id[++test] =3D synth->io_ops->synth_in();
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07 @138  		} while (synth_id[test] !=3D '\n' && test < 32);
                                                                           =
                                                        ^^^^^^^^^
This is a limit check but it's 32 instead of 40 so the array can't
actually overflow.

c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  139  		synth_id[++test] =3D 0x00;
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  140  	}
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  141  	if (synth_id[0] =3D=3D 'A')
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  142  		pr_info("%s version: %s", synth->long_name, synth_id);
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  143  }


This if statement could be merge together with the previous one.  Also
we could reverse the previous if statement:

	synth_id[0] =3D synth->io_ops->synth_in();
	if (synth_id[0] !=3D 'A')
		return;

	for (i =3D 1; i < sizeof(synth_id) - 1; i++) {
		/* read version string from synth */
		synth_id[i] =3D synth->io_ops->synth_in();
		if (synth_id[i] =3D=3D '\n')
			break;
	}
	synth_id[i] =3D '\0';
	pr_info("%s version: %s", synth->long_name, synth_id);
}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============2688919592595343495==--

