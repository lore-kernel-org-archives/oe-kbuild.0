Content-Type: multipart/mixed; boundary="===============4339186697365333522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 363/3682] drivers/gpu/drm/via/via_dri1.c:353:50: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
Date: Sat, 27 Aug 2022 04:32:59 +0800
Message-ID: <202208270436.shCkhgik-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4339186697365333522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/via/via_dri1.c:353:50: warning: Shifting signed 32-bit value by 31 b=
its is implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sam Ravnborg <sam@ravnborg.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8d0c42c9e80791e8baba2932d2cbd2dcead50d47
commit: b0b3a879258ef43cf15b0bac30b92e7c1c4ebbae [363/3682] drm/via: Embed =
via_irq in via_dri1
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b0b3a879258ef43cf15b0bac30b92e7c1c4ebbae
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/via/via_dri1.c:353:50: warning: Shifting signed 32-bit v=
alue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    via_write(dev_priv, VIA_REG_INTERRUPT, status | VIA_IRQ_GLOBAL
                                                    ^
>> drivers/gpu/drm/via/via_dri1.c:353:50: warning: Signed integer overflow =
for expression '1<<31'. [integerOverflow]
    via_write(dev_priv, VIA_REG_INTERRUPT, status | VIA_IRQ_GLOBAL
                                                    ^
>> drivers/hwmon/hwmon.c:1065:66: warning: Parameter 'data' can be declared=
 with const [constParameter]
   static int devm_hwmon_match(struct device *dev, void *res, void *data)
                                                                    ^
>> drivers/hwmon/hwmon.c:288:15: warning: Uninitialized variable: tzdata->i=
ndex [uninitvar]
     if (tzdata->index =3D=3D index) {
                 ^
--
>> drivers/hwmon/pmbus/pmbus_core.c:165:24: warning: Either the condition '=
page<0' is redundant or the array 'data->info->func[32]' is accessed at ind=
ex 32, which is out of bounds. [arrayIndexOutOfBoundsCond]
    if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
                          ^
   drivers/hwmon/pmbus/pmbus_core.c:162:11: note: Assuming that condition '=
page<0' is not redundant
    if (page < 0)
             ^
   drivers/hwmon/pmbus/pmbus_core.c:165:24: note: Array index out of bounds
    if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
                          ^

vim +353 drivers/gpu/drm/via/via_dri1.c

b0b3a879258ef4 Sam Ravnborg 2022-07-13  342  =

b0b3a879258ef4 Sam Ravnborg 2022-07-13  343  static int via_driver_irq_post=
install(struct drm_device *dev)
b0b3a879258ef4 Sam Ravnborg 2022-07-13  344  {
b0b3a879258ef4 Sam Ravnborg 2022-07-13  345  	drm_via_private_t *dev_priv =
=3D (drm_via_private_t *) dev->dev_private;
b0b3a879258ef4 Sam Ravnborg 2022-07-13  346  	u32 status;
b0b3a879258ef4 Sam Ravnborg 2022-07-13  347  =

b0b3a879258ef4 Sam Ravnborg 2022-07-13  348  	DRM_DEBUG("fun: %s\n", __func=
__);
b0b3a879258ef4 Sam Ravnborg 2022-07-13  349  	if (!dev_priv)
b0b3a879258ef4 Sam Ravnborg 2022-07-13  350  		return -EINVAL;
b0b3a879258ef4 Sam Ravnborg 2022-07-13  351  =

b0b3a879258ef4 Sam Ravnborg 2022-07-13  352  	status =3D via_read(dev_priv,=
 VIA_REG_INTERRUPT);
b0b3a879258ef4 Sam Ravnborg 2022-07-13 @353  	via_write(dev_priv, VIA_REG_I=
NTERRUPT, status | VIA_IRQ_GLOBAL
b0b3a879258ef4 Sam Ravnborg 2022-07-13  354  		  | dev_priv->irq_enable_mas=
k);
b0b3a879258ef4 Sam Ravnborg 2022-07-13  355  =

b0b3a879258ef4 Sam Ravnborg 2022-07-13  356  	/* Some magic, oh for some da=
ta sheets ! */
b0b3a879258ef4 Sam Ravnborg 2022-07-13  357  	via_write8(dev_priv, 0x83d4, =
0x11);
b0b3a879258ef4 Sam Ravnborg 2022-07-13  358  	via_write8_mask(dev_priv, 0x8=
3d5, 0x30, 0x30);
b0b3a879258ef4 Sam Ravnborg 2022-07-13  359  =

b0b3a879258ef4 Sam Ravnborg 2022-07-13  360  	return 0;
b0b3a879258ef4 Sam Ravnborg 2022-07-13  361  }
b0b3a879258ef4 Sam Ravnborg 2022-07-13  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4339186697365333522==--

