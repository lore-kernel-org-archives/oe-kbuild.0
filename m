Content-Type: multipart/mixed; boundary="===============5214257790711923606=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v7 16/18] KVM: x86: Add guest support for detecting and enabling SEV Live Migration feature.
Date: Fri, 01 May 2020 21:39:34 +0800
Message-ID: <202005012154.HBENGSFW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5214257790711923606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <42947fc3dc7a01c73677560c84dfd87498d381e0.1588234824.git.ashis=
h.kalra@amd.com>
References: <42947fc3dc7a01c73677560c84dfd87498d381e0.1588234824.git.ashish=
.kalra@amd.com>
TO: Ashish Kalra <Ashish.Kalra@amd.com>
TO: pbonzini(a)redhat.com
CC: tglx(a)linutronix.de
CC: mingo(a)redhat.com
CC: hpa(a)zytor.com
CC: joro(a)8bytes.org
CC: bp(a)suse.de
CC: thomas.lendacky(a)amd.com
CC: x86(a)kernel.org
CC: kvm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Ashish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.7-rc3]
[cannot apply to kvm/linux-next tip/x86/mm tip/x86/core next-20200501]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ashish-Kalra/Add-AMD-SEV-g=
uest-live-migration-support/20200430-202702
base:    6a8b55ed4056ea5559ebe4f6a4b247f627870d4c
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/kvm.c:410:56: sparse: sparse: invalid initializer
   arch/x86/kernel/kvm.c:795:6: sparse: sparse: symbol 'kvm_sev_migration_h=
call' was not declared. Should it be static?

# https://github.com/0day-ci/linux/commit/ec31b001157e1122024857a2b8ffcb9c7=
30e165d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout ec31b001157e1122024857a2b8ffcb9c730e165d
vim +410 arch/x86/kernel/kvm.c

4716276184ec67 Brijesh Singh 2017-10-20  406  =

ec31b001157e11 Ashish Kalra  2020-04-30  407  #ifdef CONFIG_EFI
ec31b001157e11 Ashish Kalra  2020-04-30  408  static bool setup_kvm_sev_mig=
ration(void)
ec31b001157e11 Ashish Kalra  2020-04-30  409  {
ec31b001157e11 Ashish Kalra  2020-04-30 @410  	efi_char16_t efi_Sev_Live_Mi=
g_support_name[] =3D L"SevLiveMigrationEnabled";
ec31b001157e11 Ashish Kalra  2020-04-30  411  	efi_guid_t efi_variable_guid=
 =3D MEM_ENCRYPT_GUID;
ec31b001157e11 Ashish Kalra  2020-04-30  412  	efi_status_t status;
ec31b001157e11 Ashish Kalra  2020-04-30  413  	unsigned long size;
ec31b001157e11 Ashish Kalra  2020-04-30  414  	bool enabled;
ec31b001157e11 Ashish Kalra  2020-04-30  415  =

ec31b001157e11 Ashish Kalra  2020-04-30  416  	if (!sev_live_migration_enab=
led())
ec31b001157e11 Ashish Kalra  2020-04-30  417  		return false;
ec31b001157e11 Ashish Kalra  2020-04-30  418  =

ec31b001157e11 Ashish Kalra  2020-04-30  419  	size =3D sizeof(enabled);
ec31b001157e11 Ashish Kalra  2020-04-30  420  =

ec31b001157e11 Ashish Kalra  2020-04-30  421  	if (!efi_enabled(EFI_RUNTIME=
_SERVICES)) {
ec31b001157e11 Ashish Kalra  2020-04-30  422  		pr_info("setup_kvm_sev_migr=
ation: no efi\n");
ec31b001157e11 Ashish Kalra  2020-04-30  423  		return false;
ec31b001157e11 Ashish Kalra  2020-04-30  424  	}
ec31b001157e11 Ashish Kalra  2020-04-30  425  =

ec31b001157e11 Ashish Kalra  2020-04-30  426  	/* Get variable contents int=
o buffer */
ec31b001157e11 Ashish Kalra  2020-04-30  427  	status =3D efi.get_variable(=
efi_Sev_Live_Mig_support_name,
ec31b001157e11 Ashish Kalra  2020-04-30  428  				  &efi_variable_guid, NUL=
L, &size, &enabled);
ec31b001157e11 Ashish Kalra  2020-04-30  429  =

ec31b001157e11 Ashish Kalra  2020-04-30  430  	if (status =3D=3D EFI_NOT_FO=
UND) {
ec31b001157e11 Ashish Kalra  2020-04-30  431  		pr_info("setup_kvm_sev_migr=
ation: variable not found\n");
ec31b001157e11 Ashish Kalra  2020-04-30  432  		return false;
ec31b001157e11 Ashish Kalra  2020-04-30  433  	}
ec31b001157e11 Ashish Kalra  2020-04-30  434  =

ec31b001157e11 Ashish Kalra  2020-04-30  435  	if (status !=3D EFI_SUCCESS)=
 {
ec31b001157e11 Ashish Kalra  2020-04-30  436  		pr_info("setup_kvm_sev_migr=
ation: get_variable fail\n");
ec31b001157e11 Ashish Kalra  2020-04-30  437  		return false;
ec31b001157e11 Ashish Kalra  2020-04-30  438  	}
ec31b001157e11 Ashish Kalra  2020-04-30  439  =

ec31b001157e11 Ashish Kalra  2020-04-30  440  	if (enabled =3D=3D 0) {
ec31b001157e11 Ashish Kalra  2020-04-30  441  		pr_info("setup_kvm_sev_migr=
ation: live migration disabled in OVMF\n");
ec31b001157e11 Ashish Kalra  2020-04-30  442  		return false;
ec31b001157e11 Ashish Kalra  2020-04-30  443  	}
ec31b001157e11 Ashish Kalra  2020-04-30  444  =

ec31b001157e11 Ashish Kalra  2020-04-30  445  	pr_info("setup_kvm_sev_migra=
tion: live migration enabled in OVMF\n");
ec31b001157e11 Ashish Kalra  2020-04-30  446  	wrmsrl(MSR_KVM_SEV_LIVE_MIG_=
EN, KVM_SEV_LIVE_MIGRATION_ENABLED);
ec31b001157e11 Ashish Kalra  2020-04-30  447  =

ec31b001157e11 Ashish Kalra  2020-04-30  448  	return true;
ec31b001157e11 Ashish Kalra  2020-04-30  449  }
ec31b001157e11 Ashish Kalra  2020-04-30  450  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5214257790711923606==--

