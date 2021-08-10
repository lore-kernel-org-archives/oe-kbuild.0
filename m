Content-Type: multipart/mixed; boundary="===============7584885811942291990=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 18/40] drivers/media/i2c/ov5670.c:2560:28: warning: Uninitialized variable: mi_id_offs [uninitvar]
Date: Tue, 10 Aug 2021 12:23:12 +0800
Message-ID: <202108101201.BUsC0d0M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7584885811942291990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   a1bad7fad39bfb3e5cc2b8a9d78efe348e022cc6
commit: 438b87c232f07b976c84a10dadee9250bde97f6a [18/40] CHROMIUM: media: o=
v5670: Expose vendor ID in sysfs
:::::: branch date: 6 hours ago
:::::: commit date: 9 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/i2c/ov5670.c:2560:28: warning: Uninitialized variable: mi_=
id_offs [uninitvar]
            OV5670_OTP_SRAM + mi_id_offs,
                              ^

vim +2560 drivers/media/i2c/ov5670.c

5de35c9b8dcd10 Chiranjeevi Rapolu 2017-07-13  2478  =

438b87c232f07b Tomasz Figa        2017-11-02  2479  static int ov5670_read_=
otp(struct ov5670 *ov5670)
438b87c232f07b Tomasz Figa        2017-11-02  2480  {
438b87c232f07b Tomasz Figa        2017-11-02  2481  	struct i2c_client *cli=
ent =3D v4l2_get_subdevdata(&ov5670->sd);
438b87c232f07b Tomasz Figa        2017-11-02  2482  	u32 otp_mode_ctrl, isp=
_ctrl02, flag_basic;
438b87c232f07b Tomasz Figa        2017-11-02  2483  	unsigned int mi_id_off=
s;
438b87c232f07b Tomasz Figa        2017-11-02  2484  	int ret =3D 0;
438b87c232f07b Tomasz Figa        2017-11-02  2485  	int i;
438b87c232f07b Tomasz Figa        2017-11-02  2486  =

438b87c232f07b Tomasz Figa        2017-11-02  2487  	mutex_lock(&ov5670->mu=
tex);
438b87c232f07b Tomasz Figa        2017-11-02  2488  	if (ov5670->otp_read)
438b87c232f07b Tomasz Figa        2017-11-02  2489  		goto out_unlock;
438b87c232f07b Tomasz Figa        2017-11-02  2490  =

438b87c232f07b Tomasz Figa        2017-11-02  2491  	ret =3D pm_runtime_get=
_sync(&client->dev);
438b87c232f07b Tomasz Figa        2017-11-02  2492  	if (ret < 0) {
438b87c232f07b Tomasz Figa        2017-11-02  2493  		pm_runtime_put_noidle=
(&client->dev);
438b87c232f07b Tomasz Figa        2017-11-02  2494  		goto out_unlock;
438b87c232f07b Tomasz Figa        2017-11-02  2495  	}
438b87c232f07b Tomasz Figa        2017-11-02  2496  =

438b87c232f07b Tomasz Figa        2017-11-02  2497  	if (!ov5670->streaming=
) {
438b87c232f07b Tomasz Figa        2017-11-02  2498  		ret =3D ov5670_start_=
streaming(ov5670);
438b87c232f07b Tomasz Figa        2017-11-02  2499  		if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2500  			goto out_runtime_put;
438b87c232f07b Tomasz Figa        2017-11-02  2501  	}
438b87c232f07b Tomasz Figa        2017-11-02  2502  =

438b87c232f07b Tomasz Figa        2017-11-02  2503  	ret =3D ov5670_read_re=
g(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2504  			      OV5670_REG_ISP=
_CTRL02,
438b87c232f07b Tomasz Figa        2017-11-02  2505  			      OV5670_REG_VAL=
UE_08BIT, &isp_ctrl02);
438b87c232f07b Tomasz Figa        2017-11-02  2506  	if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2507  		goto out_standby;
438b87c232f07b Tomasz Figa        2017-11-02  2508  =

438b87c232f07b Tomasz Figa        2017-11-02  2509  	ret =3D ov5670_write_r=
eg(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2510  			       OV5670_REG_IS=
P_CTRL02,
438b87c232f07b Tomasz Figa        2017-11-02  2511  			       OV5670_REG_VA=
LUE_08BIT,
438b87c232f07b Tomasz Figa        2017-11-02  2512  			       isp_ctrl02 & =
~OV5670_OTP_DPC_ENABLE);
438b87c232f07b Tomasz Figa        2017-11-02  2513  	if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2514  		goto out_standby;
438b87c232f07b Tomasz Figa        2017-11-02  2515  =

438b87c232f07b Tomasz Figa        2017-11-02  2516  	ret =3D ov5670_read_re=
g(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2517  			      OV5670_REG_OTP=
_MODE_CTRL,
438b87c232f07b Tomasz Figa        2017-11-02  2518  			      OV5670_REG_VAL=
UE_08BIT, &otp_mode_ctrl);
438b87c232f07b Tomasz Figa        2017-11-02  2519  	if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2520  		goto out_dpc_enable;
438b87c232f07b Tomasz Figa        2017-11-02  2521  =

438b87c232f07b Tomasz Figa        2017-11-02  2522  	otp_mode_ctrl |=3D OV5=
670_OTP_PROGRAM_DISABLE;
438b87c232f07b Tomasz Figa        2017-11-02  2523  	otp_mode_ctrl &=3D ~OV=
5670_OTP_MANUAL_MODE;
438b87c232f07b Tomasz Figa        2017-11-02  2524  =

438b87c232f07b Tomasz Figa        2017-11-02  2525  	ret =3D ov5670_write_r=
eg(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2526  			       OV5670_REG_OT=
P_MODE_CTRL,
438b87c232f07b Tomasz Figa        2017-11-02  2527  			       OV5670_REG_VA=
LUE_08BIT, otp_mode_ctrl);
438b87c232f07b Tomasz Figa        2017-11-02  2528  	if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2529  		goto out_dpc_enable;
438b87c232f07b Tomasz Figa        2017-11-02  2530  =

438b87c232f07b Tomasz Figa        2017-11-02  2531  	ret =3D ov5670_write_r=
eg(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2532  			       OV5670_REG_OT=
P_LOAD_CTRL,
438b87c232f07b Tomasz Figa        2017-11-02  2533  			       OV5670_REG_VA=
LUE_08BIT,
438b87c232f07b Tomasz Figa        2017-11-02  2534  			       OV5670_OTP_LO=
AD_ENABLE);
438b87c232f07b Tomasz Figa        2017-11-02  2535  	if (ret)
438b87c232f07b Tomasz Figa        2017-11-02  2536  		goto out_dpc_enable;
438b87c232f07b Tomasz Figa        2017-11-02  2537  =

438b87c232f07b Tomasz Figa        2017-11-02  2538  	usleep_range(5000, 550=
0);
438b87c232f07b Tomasz Figa        2017-11-02  2539  =

438b87c232f07b Tomasz Figa        2017-11-02  2540  	ret =3D ov5670_read_re=
g(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02  2541  			      OV5670_OTP_SRA=
M + OV5670_FLAG_BASIC_OFFSET,
438b87c232f07b Tomasz Figa        2017-11-02  2542  			      OV5670_REG_VAL=
UE_08BIT, &flag_basic);
438b87c232f07b Tomasz Figa        2017-11-02  2543  =

438b87c232f07b Tomasz Figa        2017-11-02  2544  	for (i =3D 0; i < OV56=
70_NUM_OTP_GROUP; ++i) {
438b87c232f07b Tomasz Figa        2017-11-02  2545  		u8 flag;
438b87c232f07b Tomasz Figa        2017-11-02  2546  =

438b87c232f07b Tomasz Figa        2017-11-02  2547  		flag =3D (flag_basic =
>> OV5670_OTP_GROUP_FLAG_SHIFT(i))
438b87c232f07b Tomasz Figa        2017-11-02  2548  					& OV5670_OTP_GROUP=
_FLAG_MASK;
438b87c232f07b Tomasz Figa        2017-11-02  2549  		if (flag =3D=3D OV567=
0_OTP_GROUP_FLAG_VALID) {
438b87c232f07b Tomasz Figa        2017-11-02  2550  			mi_id_offs =3D OV567=
0_OTP_MI_ID_OFFSET(i);
438b87c232f07b Tomasz Figa        2017-11-02  2551  			break;
438b87c232f07b Tomasz Figa        2017-11-02  2552  		}
438b87c232f07b Tomasz Figa        2017-11-02  2553  	}
438b87c232f07b Tomasz Figa        2017-11-02  2554  	if (i =3D=3D OV5670_NU=
M_OTP_GROUP) {
438b87c232f07b Tomasz Figa        2017-11-02  2555  		ret =3D -EFAULT;
438b87c232f07b Tomasz Figa        2017-11-02  2556  		goto out_dpc_enable;
438b87c232f07b Tomasz Figa        2017-11-02  2557  	}
438b87c232f07b Tomasz Figa        2017-11-02  2558  =

438b87c232f07b Tomasz Figa        2017-11-02  2559  	ret =3D ov5670_read_re=
g(ov5670,
438b87c232f07b Tomasz Figa        2017-11-02 @2560  			      OV5670_OTP_SRA=
M + mi_id_offs,
438b87c232f07b Tomasz Figa        2017-11-02  2561  			      OV5670_REG_VAL=
UE_08BIT, &ov5670->vendor_id);
438b87c232f07b Tomasz Figa        2017-11-02  2562  =

438b87c232f07b Tomasz Figa        2017-11-02  2563  out_dpc_enable:
438b87c232f07b Tomasz Figa        2017-11-02  2564  	ov5670_write_reg(ov567=
0,
438b87c232f07b Tomasz Figa        2017-11-02  2565  			 OV5670_REG_ISP_CTRL=
02,
438b87c232f07b Tomasz Figa        2017-11-02  2566  			 OV5670_REG_VALUE_08=
BIT,
438b87c232f07b Tomasz Figa        2017-11-02  2567  			 isp_ctrl02);
438b87c232f07b Tomasz Figa        2017-11-02  2568  =

438b87c232f07b Tomasz Figa        2017-11-02  2569  out_standby:
438b87c232f07b Tomasz Figa        2017-11-02  2570  	if (!ov5670->streaming)
438b87c232f07b Tomasz Figa        2017-11-02  2571  		ov5670_stop_streaming=
(ov5670);
438b87c232f07b Tomasz Figa        2017-11-02  2572  =

438b87c232f07b Tomasz Figa        2017-11-02  2573  out_runtime_put:
438b87c232f07b Tomasz Figa        2017-11-02  2574  	pm_runtime_put(&client=
->dev);
438b87c232f07b Tomasz Figa        2017-11-02  2575  =

438b87c232f07b Tomasz Figa        2017-11-02  2576  out_unlock:
438b87c232f07b Tomasz Figa        2017-11-02  2577  	if (!ret)
438b87c232f07b Tomasz Figa        2017-11-02  2578  		ov5670->otp_read =3D =
true;
438b87c232f07b Tomasz Figa        2017-11-02  2579  =

438b87c232f07b Tomasz Figa        2017-11-02  2580  	mutex_unlock(&ov5670->=
mutex);
438b87c232f07b Tomasz Figa        2017-11-02  2581  =

438b87c232f07b Tomasz Figa        2017-11-02  2582  	return ret;
438b87c232f07b Tomasz Figa        2017-11-02  2583  }
438b87c232f07b Tomasz Figa        2017-11-02  2584  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7584885811942291990==--

