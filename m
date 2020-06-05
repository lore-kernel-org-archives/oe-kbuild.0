Content-Type: multipart/mixed; boundary="===============6733058205325348979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/lockdown/lockdown.c:131:3: warning: Variable 'len' is modified but its new value is never used.
Date: Sat, 06 Jun 2020 07:22:47 +0800
Message-ID: <202006060743.dCy0UhOQ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6733058205325348979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Garrett <matthewgarrett@google.com>
CC: James Morris <jmorris@namei.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7ae77150d94d3b535c7b85e6b3647113095e79bf
commit: 000d388ed3bbed745f366ce71b2bb7c2ee70f449 security: Add a static loc=
kdown policy LSM
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> security/lockdown/lockdown.c:131:3: warning: Variable 'len' is modified =
but its new value is never used. [unreadVariable]
     len--;
     ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D000d388ed3bbed745f366ce71b2bb7c2ee70f449
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 000d388ed3bbed745f366ce71b2bb7c2ee70f449
vim +/len +131 security/lockdown/lockdown.c

000d388ed3bbed7 Matthew Garrett 2019-08-19  117  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  118  static ssize_t lockdown_wr=
ite(struct file *file, const char __user *buf,
000d388ed3bbed7 Matthew Garrett 2019-08-19  119  			      size_t n, loff_t =
*ppos)
000d388ed3bbed7 Matthew Garrett 2019-08-19  120  {
000d388ed3bbed7 Matthew Garrett 2019-08-19  121  	char *state;
000d388ed3bbed7 Matthew Garrett 2019-08-19  122  	int i, len, err =3D -EINV=
AL;
000d388ed3bbed7 Matthew Garrett 2019-08-19  123  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  124  	state =3D memdup_user_nul=
(buf, n);
000d388ed3bbed7 Matthew Garrett 2019-08-19  125  	if (IS_ERR(state))
000d388ed3bbed7 Matthew Garrett 2019-08-19  126  		return PTR_ERR(state);
000d388ed3bbed7 Matthew Garrett 2019-08-19  127  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  128  	len =3D strlen(state);
000d388ed3bbed7 Matthew Garrett 2019-08-19  129  	if (len && state[len-1] =
=3D=3D '\n') {
000d388ed3bbed7 Matthew Garrett 2019-08-19  130  		state[len-1] =3D '\0';
000d388ed3bbed7 Matthew Garrett 2019-08-19 @131  		len--;
000d388ed3bbed7 Matthew Garrett 2019-08-19  132  	}
000d388ed3bbed7 Matthew Garrett 2019-08-19  133  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  134  	for (i =3D 0; i < ARRAY_S=
IZE(lockdown_levels); i++) {
000d388ed3bbed7 Matthew Garrett 2019-08-19  135  		enum lockdown_reason lev=
el =3D lockdown_levels[i];
000d388ed3bbed7 Matthew Garrett 2019-08-19  136  		const char *label =3D lo=
ckdown_reasons[level];
000d388ed3bbed7 Matthew Garrett 2019-08-19  137  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  138  		if (label && !strcmp(sta=
te, label))
000d388ed3bbed7 Matthew Garrett 2019-08-19  139  			err =3D lock_kernel_dow=
n("securityfs", level);
000d388ed3bbed7 Matthew Garrett 2019-08-19  140  	}
000d388ed3bbed7 Matthew Garrett 2019-08-19  141  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  142  	kfree(state);
000d388ed3bbed7 Matthew Garrett 2019-08-19  143  	return err ? err : n;
000d388ed3bbed7 Matthew Garrett 2019-08-19  144  }
000d388ed3bbed7 Matthew Garrett 2019-08-19  145  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6733058205325348979==--

