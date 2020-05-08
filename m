Content-Type: multipart/mixed; boundary="===============7479104449549763981=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [xlnx:xlnx_rebase_v5.4 234/1296] drivers/gpu/drm/xlnx/xlnx_bridge.c:266:7: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Fri, 08 May 2020 14:07:58 +0800
Message-ID: <202005081432.DVcsMEAQ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7479104449549763981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   0b197959bbbdb68e1da974bd013339f08704b178
commit: 96aa986a927952f39a11c5e5c77175001c93443a [234/1296] drm: xlnx: drv:=
 Add Xilinx bridge support
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/xlnx/xlnx_bridge.c:266:7: warning: Redundant initializat=
ion for 'ret'. The initialized value is overwritten before it is read. [red=
undantInitialization]
     ret =3D strncpy_from_user(cmd, buf, size);
         ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:263:11: note: ret is initialized
     int ret =3D -EINVAL;
             ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:266:7: note: ret is overwritten
     ret =3D strncpy_from_user(cmd, buf, size);
         ^
>> drivers/gpu/drm/xlnx/xlnx_bridge.c:232:11: warning: Checking if unsigned=
 expression 'size' is less than zero. [unsignedLessThanZero]
    if (size <=3D 0)
             ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:252:24: warning: Checking if unsigned=
 expression 'size' is less than zero. [unsignedLessThanZero]
    if (*pos !=3D 0 || size <=3D 0)
                          ^
>> drivers/gpu/drm/xlnx/xlnx_bridge.c:261:17: warning: Local variable 'f' s=
hadows outer argument [shadowArgument]
     char *w, *h, *f;
                   ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:247:55: note: Shadowed declaration
   static ssize_t xlnx_bridge_debugfs_write(struct file *f, const char __us=
er *buf,
                                                         ^
   drivers/gpu/drm/xlnx/xlnx_bridge.c:261:17: note: Shadow variable
     char *w, *h, *f;
                   ^

# https://github.com/Xilinx/linux-xlnx/commit/96aa986a927952f39a11c5e5c7717=
5001c93443a
git remote add xlnx https://github.com/Xilinx/linux-xlnx
git remote update xlnx
git checkout 96aa986a927952f39a11c5e5c77175001c93443a
vim +/ret +266 drivers/gpu/drm/xlnx/xlnx_bridge.c

96aa986a927952f Hyun Kwon 2018-01-23  225  =

96aa986a927952f Hyun Kwon 2018-01-23  226  static ssize_t xlnx_bridge_debug=
fs_read(struct file *f, char __user *buf,
96aa986a927952f Hyun Kwon 2018-01-23  227  					size_t size, loff_t *pos)
96aa986a927952f Hyun Kwon 2018-01-23  228  {
96aa986a927952f Hyun Kwon 2018-01-23  229  	struct xlnx_bridge *bridge =3D =
f->f_inode->i_private;
96aa986a927952f Hyun Kwon 2018-01-23  230  	int ret;
96aa986a927952f Hyun Kwon 2018-01-23  231  =

96aa986a927952f Hyun Kwon 2018-01-23 @232  	if (size <=3D 0)
96aa986a927952f Hyun Kwon 2018-01-23  233  		return -EINVAL;
96aa986a927952f Hyun Kwon 2018-01-23  234  =

96aa986a927952f Hyun Kwon 2018-01-23  235  	if (*pos !=3D 0)
96aa986a927952f Hyun Kwon 2018-01-23  236  		return 0;
96aa986a927952f Hyun Kwon 2018-01-23  237  =

96aa986a927952f Hyun Kwon 2018-01-23  238  	size =3D min(size, strlen(bridg=
e->debugfs_file->status));
96aa986a927952f Hyun Kwon 2018-01-23  239  	ret =3D copy_to_user(buf, bridg=
e->debugfs_file->status, size);
96aa986a927952f Hyun Kwon 2018-01-23  240  	if (ret)
96aa986a927952f Hyun Kwon 2018-01-23  241  		return ret;
96aa986a927952f Hyun Kwon 2018-01-23  242  =

96aa986a927952f Hyun Kwon 2018-01-23  243  	*pos =3D size + 1;
96aa986a927952f Hyun Kwon 2018-01-23  244  	return size;
96aa986a927952f Hyun Kwon 2018-01-23  245  }
96aa986a927952f Hyun Kwon 2018-01-23  246  =

96aa986a927952f Hyun Kwon 2018-01-23  247  static ssize_t xlnx_bridge_debug=
fs_write(struct file *f, const char __user *buf,
96aa986a927952f Hyun Kwon 2018-01-23  248  					 size_t size, loff_t *pos)
96aa986a927952f Hyun Kwon 2018-01-23  249  {
96aa986a927952f Hyun Kwon 2018-01-23  250  	struct xlnx_bridge *bridge =3D =
f->f_inode->i_private;
96aa986a927952f Hyun Kwon 2018-01-23  251  =

96aa986a927952f Hyun Kwon 2018-01-23  252  	if (*pos !=3D 0 || size <=3D 0)
96aa986a927952f Hyun Kwon 2018-01-23  253  		return -EINVAL;
96aa986a927952f Hyun Kwon 2018-01-23  254  =

96aa986a927952f Hyun Kwon 2018-01-23  255  	if (!strncmp(buf, "enable", 5))=
 {
96aa986a927952f Hyun Kwon 2018-01-23  256  		xlnx_bridge_enable(bridge);
96aa986a927952f Hyun Kwon 2018-01-23  257  	} else if (!strncmp(buf, "disab=
le", 6)) {
96aa986a927952f Hyun Kwon 2018-01-23  258  		xlnx_bridge_disable(bridge);
96aa986a927952f Hyun Kwon 2018-01-23  259  	} else if (!strncmp(buf, "set_i=
nput", 3)) {
96aa986a927952f Hyun Kwon 2018-01-23  260  		char *cmd, **tmp;
96aa986a927952f Hyun Kwon 2018-01-23 @261  		char *w, *h, *f;
96aa986a927952f Hyun Kwon 2018-01-23  262  		u32 width, height, fmt;
96aa986a927952f Hyun Kwon 2018-01-23  263  		int ret =3D -EINVAL;
96aa986a927952f Hyun Kwon 2018-01-23  264  =

96aa986a927952f Hyun Kwon 2018-01-23  265  		cmd =3D kzalloc(size, GFP_KERN=
EL);
96aa986a927952f Hyun Kwon 2018-01-23 @266  		ret =3D strncpy_from_user(cmd,=
 buf, size);
96aa986a927952f Hyun Kwon 2018-01-23  267  		if (ret < 0) {
96aa986a927952f Hyun Kwon 2018-01-23  268  			pr_err("%s %d failed to copy =
the command  %s\n",
96aa986a927952f Hyun Kwon 2018-01-23  269  			       __func__, __LINE__, bu=
f);
96aa986a927952f Hyun Kwon 2018-01-23  270  			return ret;
96aa986a927952f Hyun Kwon 2018-01-23  271  		}
96aa986a927952f Hyun Kwon 2018-01-23  272  =

96aa986a927952f Hyun Kwon 2018-01-23  273  		tmp =3D &cmd;
96aa986a927952f Hyun Kwon 2018-01-23  274  		strsep(tmp, " ");
96aa986a927952f Hyun Kwon 2018-01-23  275  		w =3D strsep(tmp, " ");
96aa986a927952f Hyun Kwon 2018-01-23  276  		h =3D strsep(tmp, " ");
96aa986a927952f Hyun Kwon 2018-01-23  277  		f =3D strsep(tmp, " ");
96aa986a927952f Hyun Kwon 2018-01-23  278  		if (w && h && f) {
96aa986a927952f Hyun Kwon 2018-01-23  279  			ret =3D kstrtouint(w, 0, &wid=
th);
96aa986a927952f Hyun Kwon 2018-01-23  280  			ret |=3D kstrtouint(h, 0, &he=
ight);
96aa986a927952f Hyun Kwon 2018-01-23  281  			ret |=3D kstrtouint(f, 0, &fm=
t);
96aa986a927952f Hyun Kwon 2018-01-23  282  		}
96aa986a927952f Hyun Kwon 2018-01-23  283  =

96aa986a927952f Hyun Kwon 2018-01-23  284  		kfree(cmd);
96aa986a927952f Hyun Kwon 2018-01-23  285  		if (ret) {
96aa986a927952f Hyun Kwon 2018-01-23  286  			pr_err("%s %d invalid command=
: %s\n",
96aa986a927952f Hyun Kwon 2018-01-23  287  			       __func__, __LINE__, bu=
f);
96aa986a927952f Hyun Kwon 2018-01-23  288  			return -EINVAL;
96aa986a927952f Hyun Kwon 2018-01-23  289  		}
96aa986a927952f Hyun Kwon 2018-01-23  290  		xlnx_bridge_set_input(bridge, =
width, height, fmt);
96aa986a927952f Hyun Kwon 2018-01-23  291  	}
96aa986a927952f Hyun Kwon 2018-01-23  292  =

96aa986a927952f Hyun Kwon 2018-01-23  293  	return size;
96aa986a927952f Hyun Kwon 2018-01-23  294  }
96aa986a927952f Hyun Kwon 2018-01-23  295  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7479104449549763981==--

