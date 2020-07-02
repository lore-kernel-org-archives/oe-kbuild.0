Content-Type: multipart/mixed; boundary="===============7006316273583653645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v15 3/3] Input: new da7280 haptic driver
Date: Thu, 02 Jul 2020 14:21:21 +0800
Message-ID: <202007021426.bWLKH1kq%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7006316273583653645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <c7b8cb993abe7bb771108bb94e5d9edbeb4f7103.1593435662.git.Roy.I=
m@diasemi.com>
References: <c7b8cb993abe7bb771108bb94e5d9edbeb4f7103.1593435662.git.Roy.Im=
@diasemi.com>
TO: Roy Im <roy.im.opensource@diasemi.com>
TO: "Uwe Kleine-Koenig" <u.kleine-koenig@pengutronix.de>
TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
TO: Brian Masney <masneyb@onstation.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Greg KH <greg@kroah.com>
TO: Lee Jones <lee.jones@linaro.org>
TO: Luca Weiss <luca@z3ntu.xyz>
TO: Maximilian Luz <luzmaximilian@gmail.com>
TO: "Pascal PAILLET-LME" <p.paillet@st.com>
TO: Rob Herring <robh@kernel.org>

Hi Roy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on sparc-next/master]
[also build test WARNING on linus/master v5.8-rc3 next-20200701]
[cannot apply to input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Roy-Im/da7280-haptic-drive=
r-submission/20200630-110238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.gi=
t master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)


# https://github.com/0day-ci/linux/commit/9e38d67bfa309d25bd6b4e415782db070=
db80d7f
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9e38d67bfa309d25bd6b4e415782db070db80d7f
vim +1295 drivers/input/misc/da7280.c

9e38d67bfa309d Roy Im 2020-06-29  1278  =

9e38d67bfa309d Roy Im 2020-06-29  1279  static ssize_t ps_seq_id_show(struc=
t device *dev,
9e38d67bfa309d Roy Im 2020-06-29  1280  			      struct device_attribute *a=
ttr,
9e38d67bfa309d Roy Im 2020-06-29  1281  			      char *buf)
9e38d67bfa309d Roy Im 2020-06-29  1282  {
9e38d67bfa309d Roy Im 2020-06-29  1283  	struct da7280_haptic *haptics =3D =
dev_get_drvdata(dev);
9e38d67bfa309d Roy Im 2020-06-29  1284  	unsigned int val;
9e38d67bfa309d Roy Im 2020-06-29  1285  	int error;
9e38d67bfa309d Roy Im 2020-06-29  1286  =

9e38d67bfa309d Roy Im 2020-06-29  1287  	error =3D regmap_read(haptics->reg=
map, DA7280_SEQ_CTL2, &val);
9e38d67bfa309d Roy Im 2020-06-29  1288  	if (error) {
9e38d67bfa309d Roy Im 2020-06-29  1289  		dev_err(haptics->dev,
9e38d67bfa309d Roy Im 2020-06-29  1290  			"failed to read register: %pE\n"=
, ERR_PTR(error));
9e38d67bfa309d Roy Im 2020-06-29  1291  		return error;
9e38d67bfa309d Roy Im 2020-06-29  1292  	}
9e38d67bfa309d Roy Im 2020-06-29  1293  	val =3D FIELD_GET(DA7280_PS_SEQ_ID=
_MASK, val);
9e38d67bfa309d Roy Im 2020-06-29  1294  =

9e38d67bfa309d Roy Im 2020-06-29 @1295  	return sprintf(buf, "ps_seq_id is =
%d\n", val);
9e38d67bfa309d Roy Im 2020-06-29  1296  }
9e38d67bfa309d Roy Im 2020-06-29  1297  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7006316273583653645==--

