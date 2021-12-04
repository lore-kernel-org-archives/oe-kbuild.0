Content-Type: multipart/mixed; boundary="===============1201271539982644844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [t-kristo-pm:usi-5.16-rfc-v3-bpf 6/24] drivers/hid/hid-bpf.c:147:26: sparse: struct bpf_prog *
Date: Sat, 04 Dec 2021 22:16:59 +0800
Message-ID: <202112042252.VaTBMDoP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1201271539982644844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Tero Kristo <tero.kristo@linux.intel.com>

tree:   https://github.com/t-kristo/linux-pm usi-5.16-rfc-v3-bpf
head:   d0f251812c57f49830816624bec858500e4e14c2
commit: 43c0e89d85a05475bbbbcddc3533483f0cd032cb [6/24] HID: bpf: allow to =
change the report descriptor from an eBPF program
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-s002-20211203 (https://download.01.org/0day-ci/arch=
ive/20211204/202112042252.VaTBMDoP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/t-kristo/linux-pm/commit/43c0e89d85a05475bbbbc=
ddc3533483f0cd032cb
        git remote add t-kristo-pm https://github.com/t-kristo/linux-pm
        git fetch --no-tags t-kristo-pm usi-5.16-rfc-v3-bpf
        git checkout 43c0e89d85a05475bbbbcddc3533483f0cd032cb
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-bpf.c:36:21: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/hid/hid-bpf.c:36:21: sparse:    struct bpf_prog_array [noderef] =
__rcu *
   drivers/hid/hid-bpf.c:36:21: sparse:    struct bpf_prog_array *
   drivers/hid/hid-bpf.c:46:9: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/hid/hid-bpf.c:46:9: sparse:    struct bpf_prog_array [noderef] _=
_rcu *
   drivers/hid/hid-bpf.c:46:9: sparse:    struct bpf_prog_array *
   drivers/hid/hid-bpf.c:79:53: sparse: sparse: incorrect type in argument =
2 (different address spaces) @@     expected struct bpf_prog_array **array =
@@     got struct bpf_prog_array [noderef] __rcu ** @@
   drivers/hid/hid-bpf.c:101:21: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   drivers/hid/hid-bpf.c:101:21: sparse:    struct bpf_prog_array [noderef]=
 __rcu *
   drivers/hid/hid-bpf.c:101:21: sparse:    struct bpf_prog_array *
   drivers/hid/hid-bpf.c:111:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/hid/hid-bpf.c:111:9: sparse:    struct bpf_prog_array [noderef] =
__rcu *
   drivers/hid/hid-bpf.c:111:9: sparse:    struct bpf_prog_array *
   drivers/hid/hid-bpf.c:145:53: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct bpf_prog_array **array=
 @@     got struct bpf_prog_array [noderef] __rcu ** @@
   drivers/hid/hid-bpf.c:147:26: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
>> drivers/hid/hid-bpf.c:147:26: sparse:    struct bpf_prog *
>> drivers/hid/hid-bpf.c:147:26: sparse:    struct bpf_prog [noderef] __rcu=
 *
   drivers/hid/hid-bpf.c:207:27: sparse: sparse: symbol 'hid_prog_ops' was =
not declared. Should it be static?
   drivers/hid/hid-bpf.c:240:31: sparse: sparse: symbol 'hid_verifier_ops' =
was not declared. Should it be static?
>> drivers/hid/hid-bpf.c:418:31: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct bpf_prog const *prog @=
@     got struct bpf_prog [noderef] __rcu *rdesc_fixup_prog @@
>> drivers/hid/hid-bpf.c:463:39: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct bpf_prog *prog @@     =
got struct bpf_prog [noderef] __rcu *rdesc_fixup_prog @@

vim +147 drivers/hid/hid-bpf.c

43c0e89d85a054 Benjamin Tissoires 2021-10-25  138  =

1995666cad0e36 Benjamin Tissoires 2021-10-25  139  int hid_bpf_prog_detach(=
struct hid_device *hdev, struct bpf_prog *prog)
1995666cad0e36 Benjamin Tissoires 2021-10-25  140  {
43c0e89d85a054 Benjamin Tissoires 2021-10-25  141  	int ret;
43c0e89d85a054 Benjamin Tissoires 2021-10-25  142  =

1995666cad0e36 Benjamin Tissoires 2021-10-25  143  	switch(prog->expected_a=
ttach_type) {
1995666cad0e36 Benjamin Tissoires 2021-10-25  144  	case BPF_HID_RAW_EVENT:
1995666cad0e36 Benjamin Tissoires 2021-10-25  145  		return __hid_bpf_prog_=
detach(hdev, &hdev->bpf.event_progs, prog);
43c0e89d85a054 Benjamin Tissoires 2021-10-25  146  	case BPF_HID_RDESC_FIXU=
P:
43c0e89d85a054 Benjamin Tissoires 2021-10-25 @147  		if (prog !=3D hdev->bp=
f.rdesc_fixup_prog)
43c0e89d85a054 Benjamin Tissoires 2021-10-25  148  			return -EINVAL;
43c0e89d85a054 Benjamin Tissoires 2021-10-25  149  =

43c0e89d85a054 Benjamin Tissoires 2021-10-25  150  		ret =3D __hid_bpf_prog=
_detach_rdesc(hdev);
43c0e89d85a054 Benjamin Tissoires 2021-10-25  151  		if (ret)
43c0e89d85a054 Benjamin Tissoires 2021-10-25  152  			return ret;
43c0e89d85a054 Benjamin Tissoires 2021-10-25  153  =

43c0e89d85a054 Benjamin Tissoires 2021-10-25  154  		return hid_reconnect(h=
dev);
1995666cad0e36 Benjamin Tissoires 2021-10-25  155  	default:
1995666cad0e36 Benjamin Tissoires 2021-10-25  156  		return -EINVAL;
1995666cad0e36 Benjamin Tissoires 2021-10-25  157  	}
1995666cad0e36 Benjamin Tissoires 2021-10-25  158  =

1995666cad0e36 Benjamin Tissoires 2021-10-25  159  	return -EINVAL;
1995666cad0e36 Benjamin Tissoires 2021-10-25  160  }
1995666cad0e36 Benjamin Tissoires 2021-10-25  161  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1201271539982644844==--

