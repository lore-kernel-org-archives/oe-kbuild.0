Content-Type: multipart/mixed; boundary="===============8233725649613114263=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinmux.c:737 pinmux_select() error: uninitialized symbol 'groups'.
Date: Mon, 06 Dec 2021 22:35:15 +0800
Message-ID: <202112062208.dPBd7oKd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8233725649613114263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Drew Fustini <drew@beagleboard.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Tony Lindgren <tony@atomide.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
commit: 6199f6becc869d30ca9394ca0f7a484bf9d598eb pinctrl: pinmux: Add pinmu=
x-select debugfs file
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001-20211206 (https://download.01.org/0day-ci/ar=
chive/20211206/202112062208.dPBd7oKd-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pinctrl/pinmux.c:737 pinmux_select() error: uninitialized symbol 'g=
roups'.
drivers/pinctrl/pinmux.c:737 pinmux_select() error: uninitialized symbol 'n=
um_groups'.

Old smatch warnings:
drivers/pinctrl/pinmux.c:370 pinmux_map_to_setting() error: uninitialized s=
ymbol 'num_groups'.
drivers/pinctrl/pinmux.c:378 pinmux_map_to_setting() error: uninitialized s=
ymbol 'groups'.
drivers/pinctrl/pinmux.c:386 pinmux_map_to_setting() error: uninitialized s=
ymbol 'groups'.
drivers/pinctrl/pinmux.c:569 pinmux_functions_show() error: uninitialized s=
ymbol 'num_groups'.
drivers/pinctrl/pinmux.c:570 pinmux_functions_show() error: uninitialized s=
ymbol 'groups'.

vim +/groups +737 drivers/pinctrl/pinmux.c

2744e8afb3b763 Linus Walleij 2011-05-02  676  =

6199f6becc869d Drew Fustini  2021-03-01  677  #define PINMUX_SELECT_MAX 128
6199f6becc869d Drew Fustini  2021-03-01  678  static ssize_t pinmux_select(=
struct file *file, const char __user *user_buf,
6199f6becc869d Drew Fustini  2021-03-01  679  				   size_t len, loff_t *pp=
os)
6199f6becc869d Drew Fustini  2021-03-01  680  {
6199f6becc869d Drew Fustini  2021-03-01  681  	struct seq_file *sfile =3D f=
ile->private_data;
6199f6becc869d Drew Fustini  2021-03-01  682  	struct pinctrl_dev *pctldev =
=3D sfile->private;
6199f6becc869d Drew Fustini  2021-03-01  683  	const struct pinmux_ops *pmx=
ops =3D pctldev->desc->pmxops;
6199f6becc869d Drew Fustini  2021-03-01  684  	const char *const *groups;
6199f6becc869d Drew Fustini  2021-03-01  685  	char *buf, *gname, *fname;
6199f6becc869d Drew Fustini  2021-03-01  686  	unsigned int num_groups;
6199f6becc869d Drew Fustini  2021-03-01  687  	int fsel, gsel, ret;
6199f6becc869d Drew Fustini  2021-03-01  688  =

6199f6becc869d Drew Fustini  2021-03-01  689  	if (len > PINMUX_SELECT_MAX)
6199f6becc869d Drew Fustini  2021-03-01  690  		return -ENOMEM;
6199f6becc869d Drew Fustini  2021-03-01  691  =

6199f6becc869d Drew Fustini  2021-03-01  692  	buf =3D kzalloc(PINMUX_SELEC=
T_MAX, GFP_KERNEL);
6199f6becc869d Drew Fustini  2021-03-01  693  	if (!buf)
6199f6becc869d Drew Fustini  2021-03-01  694  		return -ENOMEM;
6199f6becc869d Drew Fustini  2021-03-01  695  =

6199f6becc869d Drew Fustini  2021-03-01  696  	ret =3D strncpy_from_user(bu=
f, user_buf, PINMUX_SELECT_MAX);
6199f6becc869d Drew Fustini  2021-03-01  697  	if (ret < 0)
6199f6becc869d Drew Fustini  2021-03-01  698  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  699  	buf[len-1] =3D '\0';
6199f6becc869d Drew Fustini  2021-03-01  700  =

6199f6becc869d Drew Fustini  2021-03-01  701  	/* remove leading and traili=
ng spaces of input buffer */
6199f6becc869d Drew Fustini  2021-03-01  702  	gname =3D strstrip(buf);
6199f6becc869d Drew Fustini  2021-03-01  703  	if (*gname =3D=3D '\0') {
6199f6becc869d Drew Fustini  2021-03-01  704  		ret =3D -EINVAL;
6199f6becc869d Drew Fustini  2021-03-01  705  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  706  	}
6199f6becc869d Drew Fustini  2021-03-01  707  =

6199f6becc869d Drew Fustini  2021-03-01  708  	/* find a separator which is=
 a spacelike character */
6199f6becc869d Drew Fustini  2021-03-01  709  	for (fname =3D gname; !isspa=
ce(*fname); fname++) {
6199f6becc869d Drew Fustini  2021-03-01  710  		if (*fname =3D=3D '\0') {
6199f6becc869d Drew Fustini  2021-03-01  711  			ret =3D -EINVAL;
6199f6becc869d Drew Fustini  2021-03-01  712  			goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  713  		}
6199f6becc869d Drew Fustini  2021-03-01  714  	}
6199f6becc869d Drew Fustini  2021-03-01  715  	*fname =3D '\0';
6199f6becc869d Drew Fustini  2021-03-01  716  =

6199f6becc869d Drew Fustini  2021-03-01  717  	/* drop extra spaces between=
 function and group names */
6199f6becc869d Drew Fustini  2021-03-01  718  	fname =3D skip_spaces(fname =
+ 1);
6199f6becc869d Drew Fustini  2021-03-01  719  	if (*fname =3D=3D '\0') {
6199f6becc869d Drew Fustini  2021-03-01  720  		ret =3D -EINVAL;
6199f6becc869d Drew Fustini  2021-03-01  721  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  722  	}
6199f6becc869d Drew Fustini  2021-03-01  723  =

6199f6becc869d Drew Fustini  2021-03-01  724  	ret =3D pinmux_func_name_to_=
selector(pctldev, fname);
6199f6becc869d Drew Fustini  2021-03-01  725  	if (ret < 0) {
6199f6becc869d Drew Fustini  2021-03-01  726  		dev_err(pctldev->dev, "inva=
lid function %s in map table\n", fname);
6199f6becc869d Drew Fustini  2021-03-01  727  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  728  	}
6199f6becc869d Drew Fustini  2021-03-01  729  	fsel =3D ret;
6199f6becc869d Drew Fustini  2021-03-01  730  =

6199f6becc869d Drew Fustini  2021-03-01  731  	ret =3D pmxops->get_function=
_groups(pctldev, fsel, &groups, &num_groups);
6199f6becc869d Drew Fustini  2021-03-01  732  	if (ret) {
6199f6becc869d Drew Fustini  2021-03-01  733  		dev_err(pctldev->dev, "no g=
roups for function %d (%s)", fsel, fname);
6199f6becc869d Drew Fustini  2021-03-01  734  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  735  	}
6199f6becc869d Drew Fustini  2021-03-01  736  =

6199f6becc869d Drew Fustini  2021-03-01 @737  	ret =3D match_string(groups,=
 num_groups, gname);
6199f6becc869d Drew Fustini  2021-03-01  738  	if (ret < 0) {
6199f6becc869d Drew Fustini  2021-03-01  739  		dev_err(pctldev->dev, "inva=
lid group %s", gname);
6199f6becc869d Drew Fustini  2021-03-01  740  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  741  	}
6199f6becc869d Drew Fustini  2021-03-01  742  =

6199f6becc869d Drew Fustini  2021-03-01  743  	ret =3D pinctrl_get_group_se=
lector(pctldev, gname);
6199f6becc869d Drew Fustini  2021-03-01  744  	if (ret < 0) {
6199f6becc869d Drew Fustini  2021-03-01  745  		dev_err(pctldev->dev, "fail=
ed to get group selector for %s", gname);
6199f6becc869d Drew Fustini  2021-03-01  746  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  747  	}
6199f6becc869d Drew Fustini  2021-03-01  748  	gsel =3D ret;
6199f6becc869d Drew Fustini  2021-03-01  749  =

6199f6becc869d Drew Fustini  2021-03-01  750  	ret =3D pmxops->set_mux(pctl=
dev, fsel, gsel);
6199f6becc869d Drew Fustini  2021-03-01  751  	if (ret) {
6199f6becc869d Drew Fustini  2021-03-01  752  		dev_err(pctldev->dev, "set_=
mux() failed: %d", ret);
6199f6becc869d Drew Fustini  2021-03-01  753  		goto exit_free_buf;
6199f6becc869d Drew Fustini  2021-03-01  754  	}
6199f6becc869d Drew Fustini  2021-03-01  755  	ret =3D len;
6199f6becc869d Drew Fustini  2021-03-01  756  =

6199f6becc869d Drew Fustini  2021-03-01  757  exit_free_buf:
6199f6becc869d Drew Fustini  2021-03-01  758  	kfree(buf);
6199f6becc869d Drew Fustini  2021-03-01  759  =

6199f6becc869d Drew Fustini  2021-03-01  760  	return ret;
6199f6becc869d Drew Fustini  2021-03-01  761  }
6199f6becc869d Drew Fustini  2021-03-01  762  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8233725649613114263==--

