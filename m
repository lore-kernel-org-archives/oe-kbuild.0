Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A2326A1CF
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813550; cv=none; b=u5M6GZ++WT6lNrnXj4giEilYdEEvxBPoHokml1MhcYH4wEWHOcF++EEuF7kEbT8h9847JrIW3SbI7i35LPjgX4trsF765QWuxThGkGPleRl4jdTYsk8qEYh0dQJgLIIYuK1axG4GPduBXEMikJSWWuKwF79yoIeIrUAjPBQw2IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813550; c=relaxed/simple;
	bh=+EmRxHThlCg2pCEvYFrKVsI491MON5UVyqp5jLeoDp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5c1vjTOkSsUpxXPAscXhpnU+psYV62U18yQRFSuBa/xyqy3eVTPVKBsvKVLss7mseJfem3lzewoukpvI7UMuObWOPS568McLZE0JdYrZ+72AshRd09O+UNBmnQidStWKxdGA5e5D5Td8o8ebQgke49urgnuP/YbXBWvlV0BcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=3NBT4C9S; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="3NBT4C9S"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b97e59520so20957201fa.2
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Jan 2026 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1767813545; x=1768418345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYrgs7nBDupcJayXwff8gTynCVcuYkcQv/zIbteI9R0=;
        b=3NBT4C9SLSgMko36S+Jssxmlo9Qi7aN4jyWtCpmiBwEAnqoYeahNYU5hF8UMHGHZYD
         1b3SYH9t+94RsZy9eCT3hJsz7USESQ2zHhKFTXGXf5kQnP4107TPAPlc1k2wt2f94CJV
         WqnbPIflIimpZwBNdiLnhAbLDpAPvEL2Z4zz7nGvDGSiS8mXjT2i9DmahYmORdsi4fNi
         1o/ZzZYrv2pLPmiLma9Gk/rpjX7Ln3ng8DK+NWhLRWOWxXL/4z3eZ5Xa+MgrKYo2RvBA
         oaIrptfChUba79ve5IQ8dCdLz+0yZOKgEDZMujfAmoG/Jda/dr1tX9HmEuhku4qotfYT
         DzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813545; x=1768418345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYrgs7nBDupcJayXwff8gTynCVcuYkcQv/zIbteI9R0=;
        b=LuNlufAWv9jlF3Ao/Gp2xC0liC6wnC3+vCn3SUq8ly8pj7Y/LPvPL2s1Sm5tUH9dxv
         rLk7d07SbgayjVMh+Cq7uTw+KxTB4UJSwP6gHI3s20QmlIzU04yD246+qQ9ARAfD0hus
         wY7a2iVFOjtYB/mPQmjAbpsUra7mrZfsl9gn6dEQV6zggjQrP6FTIboEiDVS6kGYHjxM
         lrKYJtxf4rVegyQBauGyCZgxV3JOheSBRDsvuyydEFnurr3fvuGiljgMNKr3vKlmiLu9
         VW4QjrTkPQdFi9VHkyCfOq1DCWWCfY8oGap2V6p9hiWBgopkoWj3Nn/hHX3jRxEaoL6n
         Lnhw==
X-Gm-Message-State: AOJu0YwJaMyUGYcVPA3H+Pe/D/VSc85AwqmK3ulv8iqt/LmONLhaMfCA
	52uAkUd0jWKHX7AYtlbvl2i+8hmlaEDim4k1v70cgNlWo33xZuuMkQ7BDPJSas6WKpOugo4lh9U
	ytc+UaU8OJ6mnM/Ep8fFqm9yxra82iJolHqt/rz8o
X-Gm-Gg: AY/fxX79OegttQbuvB5bPyVoqEXODOf1teiCPhsi8Z/BeXGhTc8Iux+8FLdpHHHumeC
	/SPKGhiZVR1pOCPY7KqIHM5Rkpmlt15H0RBWgbjLCDEvob3moYKvVMk/Sksl7YZ2mNWD+3IOcvn
	8ohszJVFkAlsT6uQJy+VnezgfChRgi7H0bpjdWycAvZTIvcXWnZDpU8IiszU1AUCYeIhF2ObueX
	XeXeC7cyAyKQuPSynNRuzzm5q2/vxxO/oaJpITge+Tdfuc5WWmvKmPWSxw50wBKSEnXWTU=
X-Google-Smtp-Source: AGHT+IFHID1uNhIC4O5ZG8p5SblpBJzUzz3ylaPWyBKkOu5jVr/jLUFMipA6M+n7v+swaN0PmYR6Yj2uBnIir/C+iPY=
X-Received: by 2002:a05:651c:505:b0:382:f4aa:8432 with SMTP id
 38308e7fff4ca-382ff85b992mr10974451fa.39.1767813544823; Wed, 07 Jan 2026
 11:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251226203021.27244-1-yahoo@perenite.com> <202512300415.VRCQoZYs-lkp@intel.com>
In-Reply-To: <202512300415.VRCQoZYs-lkp@intel.com>
From: Benoit Masson <yahoo@perenite.com>
Date: Wed, 7 Jan 2026 20:18:53 +0100
X-Gm-Features: AQt7F2qG9qETku47XoHfuzhMFcc-VZz0jwxWXRO0T_mKtC2D13Ex0ihz0VRoWcw
Message-ID: <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, jdelvare@suse.com, 
	Guenter Roeck <linux@roeck-us.net>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:10=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi benoit.masson,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmo=
n-it87-describe-per-chip-temperature-resources/20251227-043108
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stag=
ing.git hwmon-next
> patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40p=
erenite.com
> patch subject: [PATCH] hwmon: it87: describe per-chip temperature resourc=
es
> config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/a=
rchive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/
>
> smatch warnings:
> drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced=
 before IS_ERR check 'data' (see line 1691)
>
> vim +/data +1694 drivers/hwmon/it87.c
>
> 94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_t=
emp_map(struct device *dev,
> 94ac7ee616809d Jean Delvare   2010-03-05  1686                           =
        struct device_attribute *attr, char *buf)
> 94ac7ee616809d Jean Delvare   2010-03-05  1687  {
> 94ac7ee616809d Jean Delvare   2010-03-05  1688          struct sensor_dev=
ice_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
> 94ac7ee616809d Jean Delvare   2010-03-05  1689          struct it87_data =
*data =3D it87_update_device(dev);
> c962024e306ed5 Guenter Roeck  2015-04-04  1690          int nr =3D sensor=
_attr->index;
> 542f1e57c17849 benoit.masson  2025-12-26 @1691          u8 num_map =3D da=
ta->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>                                                                      ^^^^=
^^^^^^^^^^^^^^
> Unchecked dereference
>
> 94ac7ee616809d Jean Delvare   2010-03-05  1692          int map;
> 94ac7ee616809d Jean Delvare   2010-03-05  1693
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694          if (IS_ERR(data))
>                                                                    ^^^^
> Checked too late.
>
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695                  return PT=
R_ERR(data);
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696
> 0624d861983c2c Guenter Roeck  2015-04-06  1697          map =3D data->pwm=
_temp_map[nr];
>

Hi Dan,

Indeed I=E2=80=99d move the num_map assignment below the IS_ERR(data)

Is proposing a new patch V2 below the right appraoch ?

Thanks

[PATCH v2] hwmon: it87: describe per-chip temperature resources

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
drivers/hwmon/it87.c | 51 ++++++++++++++++++++++++++++++++++-----------
1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..f9eca0bc02bc 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -54,6 +54,7 @@
#include <linux/hwmon-vid.h>
#include <linux/err.h>
#include <linux/mutex.h>
+#include <linux/minmax.h>
#include <linux/sysfs.h>
#include <linux/string.h>
#include <linux/dmi.h>
@@ -279,8 +280,9 @@ static const u8 IT87_REG_AUTO_BASE[] =3D { 0x60,
0x68, 0x70, 0x78, 0xa0, 0xa8 };
#define NUM_VIN ARRAY_SIZE(IT87_REG_VIN)
#define NUM_VIN_LIMIT 8
#define NUM_TEMP 6
-#define NUM_TEMP_OFFSET ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
-#define NUM_TEMP_LIMIT 3
+#define IT87_TEMP_OFFSET_MAX ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
+#define IT87_TEMP_LIMIT_DEFAULT 3
+#define IT87_TEMP_MAP_DEFAULT 3
#define NUM_FAN ARRAY_SIZE(IT87_REG_FAN)
#define NUM_FAN_DIV 3
#define NUM_PWM ARRAY_SIZE(IT87_REG_PWM)
@@ -290,6 +292,9 @@ struct it87_devices {
const char *name;
const char * const model;
u32 features;
+ u8 num_temp_limit;
+ u8 num_temp_offset;
+ u8 num_temp_map;
u8 peci_mask;
u8 old_peci_mask;
u8 smbus_bitmap; /* SMBus enable bits in extra config register */
@@ -578,6 +583,9 @@ struct it87_data {
int sioaddr;
enum chips type;
u32 features;
+ u8 num_temp_limit;
+ u8 num_temp_offset;
+ u8 num_temp_map;
u8 peci_mask;
u8 old_peci_mask;
@@ -926,12 +934,13 @@ static struct it87_data
*it87_update_device(struct device *dev)
data->temp[i][0] =3D
it87_read_value(data, IT87_REG_TEMP(i));
- if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
+ if (has_temp_offset(data) &&
+ i < data->num_temp_offset)
data->temp[i][3] =3D
it87_read_value(data,
IT87_REG_TEMP_OFFSET[i]);
- if (i >=3D NUM_TEMP_LIMIT)
+ if (i >=3D data->num_temp_limit)
continue;
data->temp[i][1] =3D
@@ -1679,16 +1688,18 @@ static ssize_t show_pwm_temp_map(struct device *dev=
,
struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
struct it87_data *data =3D it87_update_device(dev);
int nr =3D sensor_attr->index;
+ u8 num_map;
int map;

if (IS_ERR(data))
return PTR_ERR(data);

+ num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
map =3D data->pwm_temp_map[nr];
- if (map >=3D 3)
+ if (map >=3D num_map)
map =3D 0; /* Should never happen */
- if (nr >=3D 3) /* pwm channels 3..6 map to temp4..6 */
- map +=3D 3;
+ if (nr >=3D num_map) /* pwm channels 3..6 map to temp4..6 */
+ map +=3D num_map;
return sprintf(buf, "%d\n", (int)BIT(map));
}
@@ -1700,6 +1710,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
struct it87_data *data =3D dev_get_drvdata(dev);
int nr =3D sensor_attr->index;
+ u8 num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
long val;
int err;
u8 reg;
@@ -1707,8 +1718,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
if (kstrtol(buf, 10, &val) < 0)
return -EINVAL;
- if (nr >=3D 3)
- val -=3D 3;
+ if (nr >=3D num_map)
+ val -=3D num_map;
switch (val) {
case BIT(0):
@@ -3206,7 +3217,7 @@ static void it87_check_limit_regs(struct it87_data *d=
ata)
if (reg =3D=3D 0xff)
it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
}
- for (i =3D 0; i < NUM_TEMP_LIMIT; i++) {
+ for (i =3D 0; i < data->num_temp_limit; i++) {
reg =3D it87_read_value(data, IT87_REG_TEMP_HIGH(i));
if (reg =3D=3D 0xff)
it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3399,6 +3410,7 @@ static int it87_probe(struct platform_device *pdev)
struct resource *res;
struct device *dev =3D &pdev->dev;
struct it87_sio_data *sio_data =3D dev_get_platdata(dev);
+ const struct it87_devices *chip;
int enable_pwm_interface;
struct device *hwmon_dev;
int err;
@@ -3421,9 +3433,21 @@ static int it87_probe(struct platform_device *pdev)
data->type =3D sio_data->type;
data->smbus_bitmap =3D sio_data->smbus_bitmap;
data->ec_special_config =3D sio_data->ec_special_config;
- data->features =3D it87_devices[sio_data->type].features;
- data->peci_mask =3D it87_devices[sio_data->type].peci_mask;
- data->old_peci_mask =3D it87_devices[sio_data->type].old_peci_mask;
+ chip =3D &it87_devices[sio_data->type];
+ data->features =3D chip->features;
+ data->peci_mask =3D chip->peci_mask;
+ data->old_peci_mask =3D chip->old_peci_mask;
+ data->num_temp_limit =3D chip->num_temp_limit ?
+ chip->num_temp_limit : IT87_TEMP_LIMIT_DEFAULT;
+ if (chip->num_temp_offset)
+ data->num_temp_offset =3D min(chip->num_temp_offset,
+ (u8)IT87_TEMP_OFFSET_MAX);
+ else if (has_temp_offset(data))
+ data->num_temp_offset =3D IT87_TEMP_OFFSET_MAX;
+ else
+ data->num_temp_offset =3D 0;
+ data->num_temp_map =3D chip->num_temp_map ?
+ chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
/*
* IT8705F Datasheet 0.4.1, 3h =3D=3D Version G.
* IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h =3D=3D Version J.
