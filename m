Content-Type: multipart/mixed; boundary="===============0662576135935113887=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
Date: Sun, 05 Dec 2021 08:40:28 +0800
Message-ID: <202112050811.jZxEi6SN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0662576135935113887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203023728.3699610-2-suichen@google.com>
References: <20211203023728.3699610-2-suichen@google.com>
TO: Sui Chen <suichen@google.com>

Hi Sui,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-202112=
03]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Chen/I2C-statistics-as=
-sysfs-attributes/20211203-103913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211205/202112050811.jZxEi6SN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/i2c-dev.c:866 i2c_adapter_stats_register_counter() error: unini=
tialized symbol 'ret'.

vim +/ret +866 drivers/i2c/i2c-dev.c

16ccbe6d6d8b9a Sui Chen 2021-12-02  835  =

16ccbe6d6d8b9a Sui Chen 2021-12-02  836  void i2c_adapter_stats_register_co=
unter(struct i2c_adapter* adapter,
16ccbe6d6d8b9a Sui Chen 2021-12-02  837  	const char* counter_name, void* d=
ata_source) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  838  	int ret;
16ccbe6d6d8b9a Sui Chen 2021-12-02  839  	if (adapter->stats =3D=3D NULL) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  840  		i2c_adapter_create_stats_folder(=
adapter);
16ccbe6d6d8b9a Sui Chen 2021-12-02  841  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  842  =

16ccbe6d6d8b9a Sui Chen 2021-12-02  843  	if (!strcmp(counter_name, "ber_cn=
t")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  844  		adapter->stats->ber_cnt =3D data=
_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  845  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_ber_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  846  	} else if (!strcmp(counter_name, =
"nack_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  847  		adapter->stats->nack_cnt =3D dat=
a_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  848  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_nack_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  849  	} else if (!strcmp(counter_name, =
"rec_succ_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  850  		adapter->stats->rec_succ_cnt =3D=
 data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  851  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_rec_succ_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  852  	} else if (!strcmp(counter_name, =
"rec_fail_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  853  		adapter->stats->rec_fail_cnt =3D=
 data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  854  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_rec_fail_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  855  	} else if (!strcmp(counter_name, =
"timeout_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  856  		adapter->stats->timeout_cnt =3D =
data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  857  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_timeout_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  858  	} else if (!strcmp(counter_name, =
"i2c_speed")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  859  		adapter->stats->i2c_speed =3D da=
ta_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  860  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_i2c_speed.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  861  	} else if (!strcmp(counter_name, =
"tx_complete_cnt")) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  862  		adapter->stats->tx_complete_cnt =
=3D data_source;
16ccbe6d6d8b9a Sui Chen 2021-12-02  863  		ret =3D sysfs_create_file(adapte=
r->stats->kobj, &dev_attr_tx_complete_cnt.attr);
16ccbe6d6d8b9a Sui Chen 2021-12-02  864  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  865  =

16ccbe6d6d8b9a Sui Chen 2021-12-02 @866  	if (ret) {
16ccbe6d6d8b9a Sui Chen 2021-12-02  867  		printk("Failed to create sysfs f=
ile for %s", counter_name);
16ccbe6d6d8b9a Sui Chen 2021-12-02  868  	}
16ccbe6d6d8b9a Sui Chen 2021-12-02  869  }
16ccbe6d6d8b9a Sui Chen 2021-12-02  870  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0662576135935113887==--

