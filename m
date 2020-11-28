Content-Type: multipart/mixed; boundary="===============4998992959935568507=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/rt700.c:129:25: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Sat, 28 Nov 2020 11:25:10 +0800
Message-ID: <202011281108.YK5qZAS4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4998992959935568507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shuming Fan <shumingf@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c84e1efae022071a4fcf9f1899bf71777c49943a
commit: 7d2a5f9ae41e3d3b50cd32b9fb307fab88064daf ASoC: rt700: add rt700 cod=
ec driver
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/rt700.c:129:25: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if ((jack_status & (1 << 31)) =3D=3D 0)
                           ^
   sound/soc/codecs/rt700.c:175:23: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (jack_status & (1 << 31)) {
                         ^
   sound/soc/codecs/rt700.c:232:23: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (jack_status & (1 << 31)) {
                         ^
--
>> sound/soc/codecs/rt711.c:209:25: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if ((jack_status & (1 << 31)) =3D=3D 0)
                           ^
   sound/soc/codecs/rt711.c:255:23: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (jack_status & (1 << 31)) {
                         ^
   sound/soc/codecs/rt711.c:312:23: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (jack_status & (1 << 31)) {
                         ^

vim +129 sound/soc/codecs/rt700.c

7d2a5f9ae41e3d Shuming Fan 2020-01-10  105  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  106  static int rt700_headset_detect=
(struct rt700_priv *rt700)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  107  {
7d2a5f9ae41e3d Shuming Fan 2020-01-10  108  	unsigned int buf, loop =3D 0;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  109  	int ret;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  110  	unsigned int jack_status =3D 0=
, reg;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  111  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  112  	ret =3D rt700_index_read(rt700=
->regmap,
7d2a5f9ae41e3d Shuming Fan 2020-01-10  113  					RT700_COMBO_JACK_AUTO_CTL2=
, &buf);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  114  	if (ret < 0)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  115  		goto io_error;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  116  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  117  	while (loop < 500 &&
7d2a5f9ae41e3d Shuming Fan 2020-01-10  118  		(buf & RT700_COMBOJACK_AUTO_D=
ET_STATUS) =3D=3D 0) {
7d2a5f9ae41e3d Shuming Fan 2020-01-10  119  		loop++;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  120  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  121  		usleep_range(9000, 10000);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  122  		ret =3D rt700_index_read(rt70=
0->regmap,
7d2a5f9ae41e3d Shuming Fan 2020-01-10  123  					RT700_COMBO_JACK_AUTO_CTL2=
, &buf);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  124  		if (ret < 0)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  125  			goto io_error;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  126  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  127  		reg =3D RT700_VERB_GET_PIN_SE=
NSE | RT700_HP_OUT;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  128  		ret =3D regmap_read(rt700->re=
gmap, reg, &jack_status);
7d2a5f9ae41e3d Shuming Fan 2020-01-10 @129  		if ((jack_status & (1 << 31))=
 =3D=3D 0)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  130  			goto remove_error;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  131  	}
7d2a5f9ae41e3d Shuming Fan 2020-01-10  132  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  133  	if (loop >=3D 500)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  134  		goto to_error;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  135  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  136  	if (buf & RT700_COMBOJACK_AUTO=
_DET_TRS)
7d2a5f9ae41e3d Shuming Fan 2020-01-10  137  		rt700->jack_type =3D SND_JACK=
_HEADPHONE;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  138  	else if ((buf & RT700_COMBOJAC=
K_AUTO_DET_CTIA) ||
7d2a5f9ae41e3d Shuming Fan 2020-01-10  139  		(buf & RT700_COMBOJACK_AUTO_D=
ET_OMTP))
7d2a5f9ae41e3d Shuming Fan 2020-01-10  140  		rt700->jack_type =3D SND_JACK=
_HEADSET;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  141  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  142  	return 0;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  143  =

7d2a5f9ae41e3d Shuming Fan 2020-01-10  144  to_error:
7d2a5f9ae41e3d Shuming Fan 2020-01-10  145  	ret =3D -ETIMEDOUT;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  146  	pr_err_ratelimited("Time-out e=
rror in %s\n", __func__);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  147  	return ret;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  148  io_error:
7d2a5f9ae41e3d Shuming Fan 2020-01-10  149  	pr_err_ratelimited("IO error i=
n %s, ret %d\n", __func__, ret);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  150  	return ret;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  151  remove_error:
7d2a5f9ae41e3d Shuming Fan 2020-01-10  152  	pr_err_ratelimited("Jack remov=
al in %s\n", __func__);
7d2a5f9ae41e3d Shuming Fan 2020-01-10  153  	return -ENODEV;
7d2a5f9ae41e3d Shuming Fan 2020-01-10  154  }
7d2a5f9ae41e3d Shuming Fan 2020-01-10  155  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4998992959935568507==--

