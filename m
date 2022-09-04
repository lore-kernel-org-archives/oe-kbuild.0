Content-Type: multipart/mixed; boundary="===============6305294294516709929=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/namespace.c:4039:12: warning: use of uninitialized value 'err' [CWE-457]
Date: Mon, 05 Sep 2022 06:57:53 +0800
Message-ID: <202209050654.XcGcJ51Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6305294294516709929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/namesp=
ace.c:4039:12: warning: use of uninitialized value 'err' [CWE-457] [-Wanaly=
zer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: e257039f0fc7da36ac3a522ef9a5cb4ae7852e67 mount_setattr(): clean the=
 control flow and calling conventions
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220905/202209050654.XcGcJ51Z-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De257039f0fc7da36ac3a522ef9a5cb4ae7852e67
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e257039f0fc7da36ac3a522ef9a5cb4ae7852e67
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In function 'mount_setattr_prepare':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     'do_mount_setattr': events 1-4
       |
       |fs/namespace.c:4099:12:
       | 4099 | static int do_mount_setattr(struct path *path, struct mount=
_kattr *kattr)
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'do_mount_setattr'
       |......
       | 4104 |         if (path->dentry !=3D mnt->mnt.mnt_root)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 4107 |         if (kattr->propagation) {
       |      |             ~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       |......
       | 4126 |         if (!is_mounted(&mnt->mnt))
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |
     'do_mount_setattr': event 5
       |
       |fs/mount.h:91:26:
       |   91 |         return mnt !=3D mnt->mnt_parent;
       |      |                       ~~~^~~~~~~~~~~~
       |      |                          |
       |      |                          (5) ...to here
       |
     'do_mount_setattr': events 6-8
       |
       |fs/namespace.c:4135:12:
       | 4135 |         if (!(mnt_has_parent(mnt) ? check_mnt(mnt) : is_ano=
n_ns(mnt->mnt_ns)))
       |      |            ^
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       | 4143 |         err =3D mount_setattr_prepare(kattr, mnt);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (7) ...to here
       |      |               (8) calling 'mount_setattr_prepare' from 'do_=
mount_setattr'
       |
       +--> 'mount_setattr_prepare': events 9-11
              |
              | 4014 | static int mount_setattr_prepare(struct mount_kattr =
*kattr, struct mount *mnt)
              |      |            ^~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (9) entry to 'mount_setattr_prepare'
              |......
              | 4019 |         for (m =3D mnt; m; m =3D next_mnt(m, mnt)) {
              |      |                       ~
              |      |                       |
              |      |                       (10) following 'false' branch =
(when 'm' is NULL)...
              |......
              | 4039 |         if (err) {
              |      |            ~
              |      |            |
              |      |            (11) ...to here
              |
            'mount_setattr_prepare': event 12
              |
              |cc1:
              | (12): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[=
m=1B[K' here
              |
>> fs/namespace.c:4039:12: warning: use of uninitialized value 'err' [CWE-4=
57] [-Wanalyzer-use-of-uninitialized-value]
    4039 |         if (err) {
         |            ^
     'do_mount_setattr': events 1-4
       |
       | 4099 | static int do_mount_setattr(struct path *path, struct mount=
_kattr *kattr)
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'do_mount_setattr'
       |......
       | 4104 |         if (path->dentry !=3D mnt->mnt.mnt_root)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 4107 |         if (kattr->propagation) {
       |      |             ~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       |......
       | 4126 |         if (!is_mounted(&mnt->mnt))
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |
     'do_mount_setattr': event 5
       |
       |fs/mount.h:91:26:
       |   91 |         return mnt !=3D mnt->mnt_parent;
       |      |                       ~~~^~~~~~~~~~~~
       |      |                          |
       |      |                          (5) ...to here
       |
     'do_mount_setattr': events 6-8
       |
       |fs/namespace.c:4135:12:
       | 4135 |         if (!(mnt_has_parent(mnt) ? check_mnt(mnt) : is_ano=
n_ns(mnt->mnt_ns)))
       |      |            ^
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       | 4143 |         err =3D mount_setattr_prepare(kattr, mnt);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (7) ...to here
       |      |               (8) calling 'mount_setattr_prepare' from 'do_=
mount_setattr'
       |
       +--> 'mount_setattr_prepare': events 9-13
              |
              | 4014 | static int mount_setattr_prepare(struct mount_kattr =
*kattr, struct mount *mnt)
              |      |            ^~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (9) entry to 'mount_setattr_prepare'
              |......
              | 4017 |         int err;
              |      |             ~~~
              |      |             |
              |      |             (10) region created on stack here
              | 4018 | =

              | 4019 |         for (m =3D mnt; m; m =3D next_mnt(m, mnt)) {
              |      |                       ~
              |      |                       |
              |      |                       (11) following 'false' branch =
(when 'm' is NULL)...
              |......
              | 4039 |         if (err) {
              |      |            ~
              |      |            |
              |      |            (12) ...to here
              |      |            (13) use of uninitialized value 'err' here
              |

vim +/err +4039 fs/namespace.c

a26f788b6e7a10 Christian Brauner 2022-02-03  4013  =

87bb5b60019c60 Christian Brauner 2022-02-03  4014  static int mount_setattr=
_prepare(struct mount_kattr *kattr, struct mount *mnt)
2a1867219c7b27 Christian Brauner 2021-01-21  4015  {
e257039f0fc7da Al Viro           2022-02-28  4016  	struct mount *m;
e257039f0fc7da Al Viro           2022-02-28  4017  	int err;
2a1867219c7b27 Christian Brauner 2021-01-21  4018  =

e257039f0fc7da Al Viro           2022-02-28  4019  	for (m =3D mnt; m; m =
=3D next_mnt(m, mnt)) {
e257039f0fc7da Al Viro           2022-02-28  4020  		if (!can_change_locked=
_flags(m, recalc_flags(kattr, m))) {
e257039f0fc7da Al Viro           2022-02-28  4021  			err =3D -EPERM;
e257039f0fc7da Al Viro           2022-02-28  4022  			break;
e257039f0fc7da Al Viro           2022-02-28  4023  		}
9caccd41541a6f Christian Brauner 2021-01-21  4024  =

87bb5b60019c60 Christian Brauner 2022-02-03  4025  		err =3D can_idmap_moun=
t(kattr, m);
87bb5b60019c60 Christian Brauner 2022-02-03  4026  		if (err)
e257039f0fc7da Al Viro           2022-02-28  4027  			break;
a26f788b6e7a10 Christian Brauner 2022-02-03  4028  =

e257039f0fc7da Al Viro           2022-02-28  4029  		if (!mnt_allow_writers=
(kattr, m)) {
87bb5b60019c60 Christian Brauner 2022-02-03  4030  			err =3D mnt_hold_writ=
ers(m);
87bb5b60019c60 Christian Brauner 2022-02-03  4031  			if (err)
e257039f0fc7da Al Viro           2022-02-28  4032  				break;
e257039f0fc7da Al Viro           2022-02-28  4033  		}
2a1867219c7b27 Christian Brauner 2021-01-21  4034  =

e257039f0fc7da Al Viro           2022-02-28  4035  		if (!kattr->recurse)
87bb5b60019c60 Christian Brauner 2022-02-03  4036  			return 0;
2a1867219c7b27 Christian Brauner 2021-01-21  4037  	}
2a1867219c7b27 Christian Brauner 2021-01-21  4038  =

e257039f0fc7da Al Viro           2022-02-28 @4039  	if (err) {
e257039f0fc7da Al Viro           2022-02-28  4040  		struct mount *p;
e257039f0fc7da Al Viro           2022-02-28  4041  =

e257039f0fc7da Al Viro           2022-02-28  4042  		for (p =3D mnt; p !=3D=
 m; p =3D next_mnt(p, mnt)) {
e257039f0fc7da Al Viro           2022-02-28  4043  			/* If we had to hold =
writers unblock them. */
e257039f0fc7da Al Viro           2022-02-28  4044  			if (p->mnt.mnt_flags =
& MNT_WRITE_HOLD)
e257039f0fc7da Al Viro           2022-02-28  4045  				mnt_unhold_writers(p=
);
e257039f0fc7da Al Viro           2022-02-28  4046  		}
e257039f0fc7da Al Viro           2022-02-28  4047  	}
e257039f0fc7da Al Viro           2022-02-28  4048  	return err;
e257039f0fc7da Al Viro           2022-02-28  4049  }
e257039f0fc7da Al Viro           2022-02-28  4050  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6305294294516709929==--

