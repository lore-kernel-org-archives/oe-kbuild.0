Content-Type: multipart/mixed; boundary="===============1914675686362602847=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/5] Huawei BMA: Adding Huawei BMA driver: host_cdev_drv
Date: Thu, 18 Jun 2020 13:28:16 +0300
Message-ID: <20200618102816.GS4282@kadam>
In-Reply-To: <20200615145906.1013-3-yunaixin03610@163.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1914675686362602847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

url:    https://github.com/0day-ci/linux/commits/yunaixin03610-163-com/Addi=
ng-Huawei-BMA-drivers/20200616-102318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
a5dc8300df75e8b8384b4c82225f1e4a0b4d9b55
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

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

# https://github.com/0day-ci/linux/commit/d0965c4179b69ddd204c1f795f0d6ac08=
0c657af
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout d0965c4179b69ddd204c1f795f0d6ac080c657af
vim +122 drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c

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

buf is a PAGE_SIZE buffer.  It can't be NULL.

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

I'm very worried that the sprintf loop can overflow the PAGE_SIZE.
Please replace all the sprintf() calls with scnprintf().

	len +=3D scnprintf(PAGE_SIZE - len, buf + len, "blah blah");

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
--===============1914675686362602847==--

