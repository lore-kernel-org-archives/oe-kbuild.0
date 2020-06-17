Content-Type: multipart/mixed; boundary="===============9134567717312018230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/5] Huawei BMA: Adding Huawei BMA driver: host_cdev_drv
Date: Wed, 17 Jun 2020 09:32:02 +0800
Message-ID: <202006170946.B4KIsgrb%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9134567717312018230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200615145906.1013-3-yunaixin03610@163.com>
References: <20200615145906.1013-3-yunaixin03610@163.com>
TO: yunaixin03610(a)163.com
TO: netdev(a)vger.kernel.org
CC: yunaixin <yunaixin@huawei.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.8-rc1 next-20200616]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/yunaixin03610-163-com/Addi=
ng-Huawei-BMA-drivers/20200616-102318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
a5dc8300df75e8b8384b4c82225f1e4a0b4d9b55
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:443:2: warning: Redun=
dant assignment of 'ent' to itself. [selfAssignment]
    UNUSED(ent);
    ^
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:492:2: warning: Redun=
dant assignment of 'pdev' to itself. [selfAssignment]
    UNUSED(pdev);
    ^
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:493:2: warning: Redun=
dant assignment of 'state' to itself. [selfAssignment]
    UNUSED(state);
    ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:500:2: warning: Redun=
dant assignment of 'pdev' to itself. [selfAssignment]
    UNUSED(pdev);
    ^
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:149:3: warning: Shift=
ing signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBits=
Signed]
     REGION_DIR_INPUT + (region & REGION_INDEX_MASK));
     ^
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:158:55: warning: Shif=
ting signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBit=
sSigned]
    (void)pci_write_config_dword(pdev, ATU_REGION_CTRL2, REGION_ENABLE);
                                                         ^
--
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:63:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "lost_count   :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:65:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "b2h_int      :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:67:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "h2b_int      :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:69:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "dma_count    :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:71:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "recv_bytes   :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:73:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "send_bytes   :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:75:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "recv_pkgs    :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:77:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "send_pkgs    :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:79:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "drop_pkgs    :%dn",
           ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:81:9: warning: %d i=
n format string (no. 1) requires 'int' but the argument type is 'unsigned i=
nt'. [invalidPrintfArgType_sint]
    len +=3D sprintf(buf + len, "fail_count   :%dn",
           ^
>> drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:326:21: warning: Che=
cking if unsigned variable 'count' is less than zero. [unsignedLessThanZero]
    if (!data || count <=3D 0)
                       ^
   drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:346:21: warning: Che=
cking if unsigned variable 'count' is less than zero. [unsignedLessThanZero]
    if (!data || count <=3D 0)
                       ^

# https://github.com/0day-ci/linux/commit/d0965c4179b69ddd204c1f795f0d6ac08=
0c657af
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout d0965c4179b69ddd204c1f795f0d6ac080c657af
vim +122 drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c

d0965c4179b69d yunaixin 2020-06-15   92  =

d0965c4179b69d yunaixin 2020-06-15   93  static int cdev_param_get_statics(=
char *buf, const struct kernel_param *kp)
d0965c4179b69d yunaixin 2020-06-15   94  {
d0965c4179b69d yunaixin 2020-06-15   95  	int len =3D 0;
d0965c4179b69d yunaixin 2020-06-15   96  	int i =3D 0;
d0965c4179b69d yunaixin 2020-06-15   97  	__kernel_time_t running_time =3D =
0;
d0965c4179b69d yunaixin 2020-06-15   98  =

d0965c4179b69d yunaixin 2020-06-15   99  	if (!buf)
d0965c4179b69d yunaixin 2020-06-15  100  		return 0;
d0965c4179b69d yunaixin 2020-06-15  101  =

d0965c4179b69d yunaixin 2020-06-15  102  	GET_SYS_SECONDS(running_time);
d0965c4179b69d yunaixin 2020-06-15  103  	running_time -=3D g_cdev_set.init=
_time;
d0965c4179b69d yunaixin 2020-06-15  104  	len +=3D sprintf(buf + len,
d0965c4179b69d yunaixin 2020-06-15  105  		       "=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DCDEV_DRIVER_INF=
O=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
d0965c4179b69d yunaixin 2020-06-15  106  	len +=3D sprintf(buf + len, "vers=
ion      :%s\n", CDEV_VERSION);
d0965c4179b69d yunaixin 2020-06-15  107  =

d0965c4179b69d yunaixin 2020-06-15  108  	len +=3D sprintf(buf + len, "runn=
ing_time :%luD %02lu:%02lu:%02lu\n",
d0965c4179b69d yunaixin 2020-06-15  109  		       running_time / (SECONDS_P=
ER_DAY),
d0965c4179b69d yunaixin 2020-06-15  110  		       running_time % (SECONDS_P=
ER_DAY) / SECONDS_PER_HOUR,
d0965c4179b69d yunaixin 2020-06-15  111  		       running_time % SECONDS_PE=
R_HOUR / SECONDS_PER_MINUTE,
d0965c4179b69d yunaixin 2020-06-15  112  		       running_time % SECONDS_PE=
R_MINUTE);
d0965c4179b69d yunaixin 2020-06-15  113  =

d0965c4179b69d yunaixin 2020-06-15  114  	for (i =3D 0; i < g_cdev_set.dev_=
num; i++) {
d0965c4179b69d yunaixin 2020-06-15  115  		len +=3D sprintf(buf + len,
d0965c4179b69d yunaixin 2020-06-15  116  			       "=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
d0965c4179b69d yunaixin 2020-06-15  117  		len +=3D sprintf(buf + len, "nam=
e      :%s\n",
d0965c4179b69d yunaixin 2020-06-15  118  			       g_cdev_set.dev_list[i].d=
ev_name);
d0965c4179b69d yunaixin 2020-06-15  119  		len +=3D
d0965c4179b69d yunaixin 2020-06-15  120  		    sprintf(buf + len, "dev_id  =
  :%08x\n",
d0965c4179b69d yunaixin 2020-06-15  121  			    g_cdev_set.dev_list[i].dev_=
id);
d0965c4179b69d yunaixin 2020-06-15 @122  		len +=3D sprintf(buf + len, "typ=
e      :%u\n",
d0965c4179b69d yunaixin 2020-06-15  123  			       g_cdev_set.dev_list[i].t=
ype);
d0965c4179b69d yunaixin 2020-06-15  124  		len +=3D sprintf(buf + len, "sta=
tus    :%s\n",
d0965c4179b69d yunaixin 2020-06-15  125  			       g_cdev_set.dev_list[i].s=
.open_status =3D=3D
d0965c4179b69d yunaixin 2020-06-15  126  			       1 ? "open" : "close");
d0965c4179b69d yunaixin 2020-06-15  127  		len +=3D sprintf(buf + len, "sen=
d_pkgs :%u\n",
d0965c4179b69d yunaixin 2020-06-15  128  			       g_cdev_set.dev_list[i].s=
.send_pkgs);
d0965c4179b69d yunaixin 2020-06-15  129  		len +=3D
d0965c4179b69d yunaixin 2020-06-15  130  		    sprintf(buf + len, "send_byt=
es:%u\n",
d0965c4179b69d yunaixin 2020-06-15  131  			    g_cdev_set.dev_list[i].s.se=
nd_bytes);
d0965c4179b69d yunaixin 2020-06-15  132  		len +=3D sprintf(buf + len, "sen=
d_failed_count:%u\n",
d0965c4179b69d yunaixin 2020-06-15  133  			       g_cdev_set.dev_list[i].s=
.send_failed_count);
d0965c4179b69d yunaixin 2020-06-15  134  		len +=3D sprintf(buf + len, "rec=
v_pkgs :%u\n",
d0965c4179b69d yunaixin 2020-06-15  135  			       g_cdev_set.dev_list[i].s=
.recv_pkgs);
d0965c4179b69d yunaixin 2020-06-15  136  		len +=3D sprintf(buf + len, "rec=
v_bytes:%u\n",
d0965c4179b69d yunaixin 2020-06-15  137  			       g_cdev_set.dev_list[i].s=
.recv_bytes);
d0965c4179b69d yunaixin 2020-06-15  138  		len +=3D sprintf(buf + len, "rec=
v_failed_count:%u\n",
d0965c4179b69d yunaixin 2020-06-15  139  			       g_cdev_set.dev_list[i].s=
.recv_failed_count);
d0965c4179b69d yunaixin 2020-06-15  140  	}
d0965c4179b69d yunaixin 2020-06-15  141  =

d0965c4179b69d yunaixin 2020-06-15  142  	return len;
d0965c4179b69d yunaixin 2020-06-15  143  }
d0965c4179b69d yunaixin 2020-06-15  144  module_param_call(statistics, NULL=
, cdev_param_get_statics, &debug, 0444);
d0965c4179b69d yunaixin 2020-06-15  145  MODULE_PARM_DESC(statistics, "Stat=
istics info of cdev driver,readonly");
d0965c4179b69d yunaixin 2020-06-15  146  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============9134567717312018230==--

