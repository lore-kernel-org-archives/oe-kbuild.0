Content-Type: multipart/mixed; boundary="===============0868718380470943701=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] driver: input: matric-keypad: add reduced matrix support
Date: Sat, 20 Aug 2022 01:36:29 +0800
Message-ID: <202208200111.6wvFtbES-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0868718380470943701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220819065946.9572-2-Gireesh.Hiremath@in.bosch.com>
References: <20220819065946.9572-2-Gireesh.Hiremath@in.bosch.com>
TO: Gireesh.Hiremath(a)in.bosch.com
TO: linux-omap(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-input(a)vger.kernel.org
TO: bcousson(a)baylibre.com
TO: tony(a)atomide.com
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: dmitry.torokhov(a)gmail.com
TO: mkorpershoek(a)baylibre.com
TO: davidgow(a)google.com
TO: m.felsch(a)pengutronix.de
TO: swboyd(a)chromium.org
TO: fengping.yu(a)mediatek.com
TO: y.oudjana(a)protonmail.com
TO: rdunlap(a)infradead.org
TO: colin.king(a)intel.com
TO: Gireesh.Hiremath(a)in.bosch.com
CC: sjoerd.simons(a)collabora.co.uk
CC: VinayKumar.Shettar(a)in.bosch.com
CC: Govindaraji.Sivanantham(a)in.bosch.com
CC: anaclaudia.dias(a)de.bosch.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gireesh-Hiremath-in-=
bosch-com/driver-input-matric-keypad-switch-to-gpiod/20220819-151155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-randconfig-m041-20220819 (https://download.01.org/0day-ci/arch=
ive/20220820/202208200111.6wvFtbES-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/input/keyboard/matrix_keypad.c:932 matrix_keypad_probe() error: uni=
nitialized symbol 'err'.

vim +/err +932 drivers/input/keyboard/matrix_keypad.c

4a83eecff65bd3 AnilKumar Ch     2012-11-20  822  =

5298cc4cc753bb Bill Pemberton   2012-11-23  823  static int matrix_keypad_p=
robe(struct platform_device *pdev)
bab7614d6d1b1f Eric Miao        2009-06-29  824  {
bab7614d6d1b1f Eric Miao        2009-06-29  825  	const struct matrix_keypa=
d_platform_data *pdata;
bab7614d6d1b1f Eric Miao        2009-06-29  826  	struct matrix_keypad *key=
pad;
bab7614d6d1b1f Eric Miao        2009-06-29  827  	struct input_dev *input_d=
ev;
bab7614d6d1b1f Eric Miao        2009-06-29  828  	int err;
bab7614d6d1b1f Eric Miao        2009-06-29  829  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  830  	pdata =3D dev_get_platdat=
a(&pdev->dev);
bab7614d6d1b1f Eric Miao        2009-06-29  831  	if (!pdata) {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  832  		pdata =3D matrix_keypad_=
parse_dt(&pdev->dev);
d55bda1b3e7c5a Christian Hoff   2018-11-12  833  		if (IS_ERR(pdata))
4a83eecff65bd3 AnilKumar Ch     2012-11-20  834  			return PTR_ERR(pdata);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  835  	} else if (!pdata->keymap=
_data) {
bab7614d6d1b1f Eric Miao        2009-06-29  836  		dev_err(&pdev->dev, "no =
keymap data defined\n");
bab7614d6d1b1f Eric Miao        2009-06-29  837  		return -EINVAL;
bab7614d6d1b1f Eric Miao        2009-06-29  838  	}
bab7614d6d1b1f Eric Miao        2009-06-29  839  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  840  	keypad =3D kzalloc(sizeof=
(struct matrix_keypad), GFP_KERNEL);
bab7614d6d1b1f Eric Miao        2009-06-29  841  	input_dev =3D input_alloc=
ate_device();
01111fcd42b050 Dmitry Torokhov  2012-04-20  842  	if (!keypad || !input_dev=
) {
bab7614d6d1b1f Eric Miao        2009-06-29  843  		err =3D -ENOMEM;
bab7614d6d1b1f Eric Miao        2009-06-29  844  		goto err_free_mem;
bab7614d6d1b1f Eric Miao        2009-06-29  845  	}
bab7614d6d1b1f Eric Miao        2009-06-29  846  =

bab7614d6d1b1f Eric Miao        2009-06-29  847  	keypad->input_dev =3D inp=
ut_dev;
bab7614d6d1b1f Eric Miao        2009-06-29  848  	keypad->pdata =3D pdata;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  849  	keypad->row_shift =3D get=
_count_order(pdata->num_col_gpios);
bab7614d6d1b1f Eric Miao        2009-06-29  850  	keypad->stopped =3D true;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  851  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  852  	if (pdata->mode =3D=3D RE=
DUCED) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  853  		keypad->button_array =3D=
 devm_kzalloc(
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  854  			&pdev->dev,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  855  			sizeof(struct button) *=
 (pdata->num_of_buttons),
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  856  			GFP_KERNEL);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  857  		if (!keypad->button_arra=
y) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  858  			dev_err(&pdev->dev,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  859  				"could not allocate me=
mory for button array\n");
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  860  			goto err_free_mem;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  861  			;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  862  		}
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  863  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  864  		poll_prepare(keypad);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  865  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  866  		err =3D input_setup_poll=
ing(input_dev, matrix_keypad_poll);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  867  		if (err) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  868  			dev_err(&pdev->dev,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  869  				"unable to set up poll=
ing, err=3D%d\n", err);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  870  			return err;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  871  		}
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  872  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  873  		input_set_poll_interval(=
input_dev, pdata->poll_interval_ms);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  874  	} else {
bab7614d6d1b1f Eric Miao        2009-06-29  875  		INIT_DELAYED_WORK(&keypa=
d->work, matrix_keypad_scan);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  876  	}
bab7614d6d1b1f Eric Miao        2009-06-29  877  	spin_lock_init(&keypad->l=
ock);
bab7614d6d1b1f Eric Miao        2009-06-29  878  =

bab7614d6d1b1f Eric Miao        2009-06-29  879  	input_dev->name =3D pdev-=
>name;
bab7614d6d1b1f Eric Miao        2009-06-29  880  	input_dev->id.bustype =3D=
 BUS_HOST;
bab7614d6d1b1f Eric Miao        2009-06-29  881  	input_dev->dev.parent =3D=
 &pdev->dev;
bab7614d6d1b1f Eric Miao        2009-06-29  882  	input_dev->open =3D matri=
x_keypad_start;
bab7614d6d1b1f Eric Miao        2009-06-29  883  	input_dev->close =3D matr=
ix_keypad_stop;
bab7614d6d1b1f Eric Miao        2009-06-29  884  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  885  	if (pdata->mode =3D=3D RE=
DUCED) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  886  		err =3D matrix_keypad_bu=
ild_keymap(pdata->keymap_data, NULL,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  887  						 pdata->num_line_gpi=
os,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  888  						 pdata->num_line_gpi=
os, NULL,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  889  						 input_dev);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  890  		if (err) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  891  			dev_err(&pdev->dev, "fa=
iled to build keymap for reduced mode\n");
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  892  			goto err_free_mem;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  893  		}
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  894  	} else {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  895  		err =3D matrix_keypad_bu=
ild_keymap(pdata->keymap_data, NULL,
1932811f426fee Dmitry Torokhov  2012-05-10  896  						 pdata->num_row_gpio=
s,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  897  						 pdata->num_col_gpio=
s, NULL,
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  898  						 input_dev);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  899  		if (err) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  900  			dev_err(&pdev->dev, "fa=
iled to build keymap for generic mode\n");
1932811f426fee Dmitry Torokhov  2012-05-10  901  			goto err_free_mem;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  902  		}
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  903  	}
bab7614d6d1b1f Eric Miao        2009-06-29  904  =

1932811f426fee Dmitry Torokhov  2012-05-10  905  	if (!pdata->no_autorepeat)
1932811f426fee Dmitry Torokhov  2012-05-10  906  		__set_bit(EV_REP, input_=
dev->evbit);
bab7614d6d1b1f Eric Miao        2009-06-29  907  	input_set_capability(inpu=
t_dev, EV_MSC, MSC_SCAN);
bab7614d6d1b1f Eric Miao        2009-06-29  908  	input_set_drvdata(input_d=
ev, keypad);
bab7614d6d1b1f Eric Miao        2009-06-29  909  =

a0b420e08e3b87 Gireesh Hiremath 2022-08-19  910  	if (pdata->mode =3D=3D RE=
DUCED) {
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  911  		button_hdl_init(keypad);
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  912  	} else {
b83643ebf22423 Dmitry Torokhov  2012-04-20  913  		err =3D matrix_keypad_in=
it_gpio(pdev, keypad);
bab7614d6d1b1f Eric Miao        2009-06-29  914  		if (err)
bab7614d6d1b1f Eric Miao        2009-06-29  915  			goto err_free_mem;
a0b420e08e3b87 Gireesh Hiremath 2022-08-19  916  	}
bab7614d6d1b1f Eric Miao        2009-06-29  917  =

bab7614d6d1b1f Eric Miao        2009-06-29  918  	err =3D input_register_de=
vice(keypad->input_dev);
bab7614d6d1b1f Eric Miao        2009-06-29  919  	if (err)
b83643ebf22423 Dmitry Torokhov  2012-04-20  920  		goto err_free_gpio;
bab7614d6d1b1f Eric Miao        2009-06-29  921  =

bab7614d6d1b1f Eric Miao        2009-06-29  922  	device_init_wakeup(&pdev-=
>dev, pdata->wakeup);
bab7614d6d1b1f Eric Miao        2009-06-29  923  	platform_set_drvdata(pdev=
, keypad);
bab7614d6d1b1f Eric Miao        2009-06-29  924  =

bab7614d6d1b1f Eric Miao        2009-06-29  925  	return 0;
bab7614d6d1b1f Eric Miao        2009-06-29  926  =

b83643ebf22423 Dmitry Torokhov  2012-04-20  927  err_free_gpio:
b83643ebf22423 Dmitry Torokhov  2012-04-20  928  	matrix_keypad_free_gpio(k=
eypad);
bab7614d6d1b1f Eric Miao        2009-06-29  929  err_free_mem:
bab7614d6d1b1f Eric Miao        2009-06-29  930  	input_free_device(input_d=
ev);
bab7614d6d1b1f Eric Miao        2009-06-29  931  	kfree(keypad);
bab7614d6d1b1f Eric Miao        2009-06-29 @932  	return err;
bab7614d6d1b1f Eric Miao        2009-06-29  933  }
bab7614d6d1b1f Eric Miao        2009-06-29  934  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0868718380470943701==--

