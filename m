Content-Type: multipart/mixed; boundary="===============0091096990933532057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/accessibility/speakup/speakup_audptr.c:138:20: warning: Array index 'test' is used before limits check.
Date: Fri, 29 Jan 2021 01:00:52 +0800
Message-ID: <202101290147.s8x8A4L6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0091096990933532057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   76c057c84d286140c6c416c3b4ba832cd1d8984e
commit: 2067fd92d75b6d9085a43caf050bca5d88c491b8 staging/speakup: Move out =
of staging
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
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
10-07  126  =

c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  127  static void synth_version(struct spk_synth *synth)
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  128  {
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  129  	unsigned char test =3D 0;
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  130  	char synth_id[40] =3D "";
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
c6e3fd22cd5383 drivers/staging/speakup/speakup_audptr.c William Hubbs 2010-=
10-07  144  =


:::::: The code at line 138 was first introduced by commit
:::::: c6e3fd22cd538365bfeb82997d5b89562e077d42 Staging: add speakup to the=
 staging directory

:::::: TO: William Hubbs <w.d.hubbs@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0091096990933532057==--

