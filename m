Content-Type: multipart/mixed; boundary="===============3766974857977409601=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 6/7] hwmon: (nct6775) Split core and platform driver
Date: Thu, 28 Apr 2022 18:18:07 +0800
Message-ID: <202204281804.lPMA1iJG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3766974857977409601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427010154.29749-7-zev@bewilderbeest.net>
References: <20220427010154.29749-7-zev@bewilderbeest.net>
TO: Zev Weiss <zev@bewilderbeest.net>

Hi Zev,

I love your patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v5.18-rc4]
[cannot apply to next-20220428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zev-Weiss/hwmon-nct6=
775-Convert-to-regmap-add-i2c-support/20220427-090529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-next
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 348351883e68a4e034f4a4b8a600a82177d68cc7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/hwmon/nct6775-core.c:1867:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn", data->rpm[nr]);
           ^
   drivers/hwmon/nct6775-core.c:1880:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:2798:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:3016:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hwmon/nct6775-core.c:1867:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn", data->rpm[nr]);
           ^
   drivers/hwmon/nct6775-core.c:1880:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:2798:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:3016:9: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
    return sprintf(buf, "%dn",
           ^
>> drivers/hwmon/nct6775-core.c:945:7: warning: union member 'Anonymous0::i=
ndex' is never used. [unusedStructMember]
     int index;
         ^

vim +1867 drivers/hwmon/nct6775-core.c

9de2e2e84e7d52 drivers/hwmon/nct6775.c Guenter Roeck 2012-05-20  1856  =

1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1857  stat=
ic ssize_t
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1858  show=
_fan(struct device *dev, struct device_attribute *attr, char *buf)
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1859  {
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1860  	str=
uct nct6775_data *data =3D nct6775_update_device(dev);
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1861  	str=
uct sensor_device_attribute *sattr =3D to_sensor_dev_attr(attr);
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1862  	int=
 nr =3D sattr->index;
9cd892bcbe32fe drivers/hwmon/nct6775.c Guenter Roeck 2014-11-16  1863  =

bc1057310b7eb6 drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  1864  	if =
(IS_ERR(data))
bc1057310b7eb6 drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  1865  		re=
turn PTR_ERR(data);
bc1057310b7eb6 drivers/hwmon/nct6775.c Zev Weiss     2022-04-26  1866  =

1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04 @1867  	ret=
urn sprintf(buf, "%d\n", data->rpm[nr]);
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1868  }
1c65dc365ed38d drivers/hwmon/nct6775.c Guenter Roeck 2012-12-04  1869  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3766974857977409601==--

