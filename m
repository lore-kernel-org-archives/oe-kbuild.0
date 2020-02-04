Content-Type: multipart/mixed; boundary="===============5173532304761046213=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 2/2] PCI: HIP: Add handling of HiSilicon HIP PCIe controller's errors
Date: Tue, 04 Feb 2020 17:31:42 +0300
Message-ID: <20200204143142.GQ11068@kadam>
In-Reply-To: <20200203165122.17748-3-shiju.jose@huawei.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5173532304761046213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shiju,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Shiju-Jose/ACPI-APEI-Add-s=
upport-to-notify-the-vendor-specific-HW-errors/20200204-073736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/controller/pcie-hisi-error.c:234 hisi_pcie_handle_one_error() w=
arn: should '((((1))) << (9 + i))' be a 64 bit type?

# https://github.com/0day-ci/linux/commit/71688ac6d222c137b66a707f8a6fdf28b=
48e1942
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 71688ac6d222c137b66a707f8a6fdf28b48e1942
vim +234 drivers/pci/controller/pcie-hisi-error.c

71688ac6d222c1 Yicong Yang 2020-02-03  228  	p +=3D snprintf(p, end - p, "]=
\n");
71688ac6d222c1 Yicong Yang 2020-02-03  229  	dev_info(dev, "\nHISI : HIP : =
PCIe controller error\n");
71688ac6d222c1 Yicong Yang 2020-02-03  230  	dev_info(dev, "%s\n", buf);
71688ac6d222c1 Yicong Yang 2020-02-03  231  =

71688ac6d222c1 Yicong Yang 2020-02-03  232  	dev_info(dev, "Reg Dump:\n");
71688ac6d222c1 Yicong Yang 2020-02-03  233  	for (i =3D 0; i < HISI_PCIE_ER=
R_MISC_REGS; i++) {
71688ac6d222c1 Yicong Yang 2020-02-03 @234  		if (err->val_bits & BIT(HISI_=
PCIE_LOCAL_VALID_ERR_MISC + i))
                                                                           =
 ^^^
This should be BIT_ULL() because it goes up to 9 + 32.

71688ac6d222c1 Yicong Yang 2020-02-03  235  			dev_info(dev,
71688ac6d222c1 Yicong Yang 2020-02-03  236  				 "ERR_MISC_%d=3D0x%x\n", i,=
 err->err_misc[i]);
71688ac6d222c1 Yicong Yang 2020-02-03  237  	}
71688ac6d222c1 Yicong Yang 2020-02-03  238  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5173532304761046213==--

