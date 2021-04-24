Content-Type: multipart/mixed; boundary="===============3811746775862123593=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/4] KVM: stats: Add fd-based API to read binary stats data
Date: Sat, 24 Apr 2021 08:08:03 +0800
Message-ID: <202104240844.fGu7FMRY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3811746775862123593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210423181727.596466-3-jingzhangos@google.com>
References: <20210423181727.596466-3-jingzhangos@google.com>
TO: Jing Zhang <jingzhangos@google.com>
TO: KVM <kvm@vger.kernel.org>
TO: KVMARM <kvmarm@lists.cs.columbia.edu>
TO: LinuxMIPS <linux-mips@vger.kernel.org>
TO: KVMPPC <kvm-ppc@vger.kernel.org>
TO: LinuxS390 <linux-s390@vger.kernel.org>
TO: Linuxkselftest <linux-kselftest@vger.kernel.org>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Marc Zyngier <maz@kernel.org>
TO: James Morse <james.morse@arm.com>
TO: Julien Thierry <julien.thierry.kdev@gmail.com>

Hi Jing,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on edf408f5257ba39e63781b820528e1ce1ec0f543]

url:    https://github.com/0day-ci/linux/commits/Jing-Zhang/KVM-statistics-=
data-fd-based-binary-interface/20210424-021900
base:   edf408f5257ba39e63781b820528e1ce1ec0f543
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: s390-randconfig-s031-20210423 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/98e35f50b192b960e390c3f4f=
087ef863c906082
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jing-Zhang/KVM-statistics-data-fd-=
based-binary-interface/20210424-021900
        git checkout 98e35f50b192b960e390c3f4f087ef863c906082
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/s390/kvm/kvm-s390.c:154:9: sparse: sparse: too long initializer-str=
ing for array of char
   arch/s390/kvm/kvm-s390.c:156:9: sparse: sparse: too long initializer-str=
ing for array of char

vim +154 arch/s390/kvm/kvm-s390.c

98e35f50b192b9 Jing Zhang 2021-04-23   77  =

98e35f50b192b9 Jing Zhang 2021-04-23   78  struct _kvm_stats_desc kvm_vcpu_=
stats_desc[] =3D {
98e35f50b192b9 Jing Zhang 2021-04-23   79  	STATS_VCPU_COMMON,
98e35f50b192b9 Jing Zhang 2021-04-23   80  	STATS_DESC_COUNTER("exit_usersp=
ace"),
98e35f50b192b9 Jing Zhang 2021-04-23   81  	STATS_DESC_COUNTER("exit_null"),
98e35f50b192b9 Jing Zhang 2021-04-23   82  	STATS_DESC_COUNTER("exit_extern=
al_request"),
98e35f50b192b9 Jing Zhang 2021-04-23   83  	STATS_DESC_COUNTER("exit_io_req=
uest"),
98e35f50b192b9 Jing Zhang 2021-04-23   84  	STATS_DESC_COUNTER("exit_extern=
al_interrupt"),
98e35f50b192b9 Jing Zhang 2021-04-23   85  	STATS_DESC_COUNTER("exit_stop_r=
equest"),
98e35f50b192b9 Jing Zhang 2021-04-23   86  	STATS_DESC_COUNTER("exit_validi=
ty"),
98e35f50b192b9 Jing Zhang 2021-04-23   87  	STATS_DESC_COUNTER("exit_instru=
ction"),
98e35f50b192b9 Jing Zhang 2021-04-23   88  	STATS_DESC_COUNTER("exit_pei"),
98e35f50b192b9 Jing Zhang 2021-04-23   89  	STATS_DESC_COUNTER("halt_no_pol=
l_steal"),
98e35f50b192b9 Jing Zhang 2021-04-23   90  	STATS_DESC_COUNTER("instruction=
_lctl"),
98e35f50b192b9 Jing Zhang 2021-04-23   91  	STATS_DESC_COUNTER("instruction=
_lctlg"),
98e35f50b192b9 Jing Zhang 2021-04-23   92  	STATS_DESC_COUNTER("instruction=
_stctl"),
98e35f50b192b9 Jing Zhang 2021-04-23   93  	STATS_DESC_COUNTER("instruction=
_stctg"),
98e35f50b192b9 Jing Zhang 2021-04-23   94  	STATS_DESC_COUNTER("exit_progra=
m_interruption"),
98e35f50b192b9 Jing Zhang 2021-04-23   95  	STATS_DESC_COUNTER("exit_instr_=
and_program"),
98e35f50b192b9 Jing Zhang 2021-04-23   96  	STATS_DESC_COUNTER("exit_operat=
ion_exception"),
98e35f50b192b9 Jing Zhang 2021-04-23   97  	STATS_DESC_COUNTER("deliver_ckc=
"),
98e35f50b192b9 Jing Zhang 2021-04-23   98  	STATS_DESC_COUNTER("deliver_cpu=
tm"),
98e35f50b192b9 Jing Zhang 2021-04-23   99  	STATS_DESC_COUNTER("deliver_ext=
ernal_call"),
98e35f50b192b9 Jing Zhang 2021-04-23  100  	STATS_DESC_COUNTER("deliver_eme=
rgency_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  101  	STATS_DESC_COUNTER("deliver_ser=
vice_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  102  	STATS_DESC_COUNTER("deliver_vir=
tio"),
98e35f50b192b9 Jing Zhang 2021-04-23  103  	STATS_DESC_COUNTER("deliver_sto=
p_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  104  	STATS_DESC_COUNTER("deliver_pre=
fix_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  105  	STATS_DESC_COUNTER("deliver_res=
tart_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  106  	STATS_DESC_COUNTER("deliver_pro=
gram"),
98e35f50b192b9 Jing Zhang 2021-04-23  107  	STATS_DESC_COUNTER("deliver_io"=
),
98e35f50b192b9 Jing Zhang 2021-04-23  108  	STATS_DESC_COUNTER("deliver_mac=
hine_check"),
98e35f50b192b9 Jing Zhang 2021-04-23  109  	STATS_DESC_COUNTER("exit_wait_s=
tate"),
98e35f50b192b9 Jing Zhang 2021-04-23  110  	STATS_DESC_COUNTER("inject_ckc"=
),
98e35f50b192b9 Jing Zhang 2021-04-23  111  	STATS_DESC_COUNTER("inject_cput=
m"),
98e35f50b192b9 Jing Zhang 2021-04-23  112  	STATS_DESC_COUNTER("inject_exte=
rnal_call"),
98e35f50b192b9 Jing Zhang 2021-04-23  113  	STATS_DESC_COUNTER("inject_emer=
gency_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  114  	STATS_DESC_COUNTER("inject_mchk=
"),
98e35f50b192b9 Jing Zhang 2021-04-23  115  	STATS_DESC_COUNTER("inject_pfau=
lt_init"),
98e35f50b192b9 Jing Zhang 2021-04-23  116  	STATS_DESC_COUNTER("inject_prog=
ram"),
98e35f50b192b9 Jing Zhang 2021-04-23  117  	STATS_DESC_COUNTER("inject_rest=
art"),
98e35f50b192b9 Jing Zhang 2021-04-23  118  	STATS_DESC_COUNTER("inject_set_=
prefix"),
98e35f50b192b9 Jing Zhang 2021-04-23  119  	STATS_DESC_COUNTER("inject_stop=
_signal"),
98e35f50b192b9 Jing Zhang 2021-04-23  120  	STATS_DESC_COUNTER("instruction=
_epsw"),
98e35f50b192b9 Jing Zhang 2021-04-23  121  	STATS_DESC_COUNTER("instruction=
_gs"),
98e35f50b192b9 Jing Zhang 2021-04-23  122  	STATS_DESC_COUNTER("instruction=
_io_other"),
98e35f50b192b9 Jing Zhang 2021-04-23  123  	STATS_DESC_COUNTER("instruction=
_lpsw"),
98e35f50b192b9 Jing Zhang 2021-04-23  124  	STATS_DESC_COUNTER("instruction=
_lpswe"),
98e35f50b192b9 Jing Zhang 2021-04-23  125  	STATS_DESC_COUNTER("instruction=
_pfmf"),
98e35f50b192b9 Jing Zhang 2021-04-23  126  	STATS_DESC_COUNTER("instruction=
_ptff"),
98e35f50b192b9 Jing Zhang 2021-04-23  127  	STATS_DESC_COUNTER("instruction=
_sck"),
98e35f50b192b9 Jing Zhang 2021-04-23  128  	STATS_DESC_COUNTER("instruction=
_sckpf"),
98e35f50b192b9 Jing Zhang 2021-04-23  129  	STATS_DESC_COUNTER("instruction=
_stidp"),
98e35f50b192b9 Jing Zhang 2021-04-23  130  	STATS_DESC_COUNTER("instruction=
_spx"),
98e35f50b192b9 Jing Zhang 2021-04-23  131  	STATS_DESC_COUNTER("instruction=
_stpx"),
98e35f50b192b9 Jing Zhang 2021-04-23  132  	STATS_DESC_COUNTER("instruction=
_stap"),
98e35f50b192b9 Jing Zhang 2021-04-23  133  	STATS_DESC_COUNTER("instruction=
_iske"),
98e35f50b192b9 Jing Zhang 2021-04-23  134  	STATS_DESC_COUNTER("instruction=
_ri"),
98e35f50b192b9 Jing Zhang 2021-04-23  135  	STATS_DESC_COUNTER("instruction=
_rrbe"),
98e35f50b192b9 Jing Zhang 2021-04-23  136  	STATS_DESC_COUNTER("instruction=
_sske"),
98e35f50b192b9 Jing Zhang 2021-04-23  137  	STATS_DESC_COUNTER("instruction=
_ipte_interlock"),
98e35f50b192b9 Jing Zhang 2021-04-23  138  	STATS_DESC_COUNTER("instruction=
_stsi"),
98e35f50b192b9 Jing Zhang 2021-04-23  139  	STATS_DESC_COUNTER("instruction=
_stfl"),
98e35f50b192b9 Jing Zhang 2021-04-23  140  	STATS_DESC_COUNTER("instruction=
_tb"),
98e35f50b192b9 Jing Zhang 2021-04-23  141  	STATS_DESC_COUNTER("instruction=
_tpi"),
98e35f50b192b9 Jing Zhang 2021-04-23  142  	STATS_DESC_COUNTER("instruction=
_tprot"),
98e35f50b192b9 Jing Zhang 2021-04-23  143  	STATS_DESC_COUNTER("instruction=
_tsch"),
98e35f50b192b9 Jing Zhang 2021-04-23  144  	STATS_DESC_COUNTER("instruction=
_sie"),
98e35f50b192b9 Jing Zhang 2021-04-23  145  	STATS_DESC_COUNTER("instruction=
_essa"),
98e35f50b192b9 Jing Zhang 2021-04-23  146  	STATS_DESC_COUNTER("instruction=
_sthyi"),
98e35f50b192b9 Jing Zhang 2021-04-23  147  	STATS_DESC_COUNTER("instruction=
_sigp_sense"),
98e35f50b192b9 Jing Zhang 2021-04-23  148  	STATS_DESC_COUNTER("instruction=
_sigp_sense_running"),
98e35f50b192b9 Jing Zhang 2021-04-23  149  	STATS_DESC_COUNTER("instruction=
_sigp_external_call"),
98e35f50b192b9 Jing Zhang 2021-04-23  150  	STATS_DESC_COUNTER("instruction=
_sigp_emergency"),
98e35f50b192b9 Jing Zhang 2021-04-23  151  	STATS_DESC_COUNTER("instruction=
_sigp_cond_emergency"),
98e35f50b192b9 Jing Zhang 2021-04-23  152  	STATS_DESC_COUNTER("instruction=
_sigp_start"),
98e35f50b192b9 Jing Zhang 2021-04-23  153  	STATS_DESC_COUNTER("instruction=
_sigp_stop"),
98e35f50b192b9 Jing Zhang 2021-04-23 @154  	STATS_DESC_COUNTER("instruction=
_sigp_stop_store_status"),
98e35f50b192b9 Jing Zhang 2021-04-23  155  	STATS_DESC_COUNTER("instruction=
_sigp_store_status"),
98e35f50b192b9 Jing Zhang 2021-04-23  156  	STATS_DESC_COUNTER("instruction=
_sigp_store_adtl_status"),
98e35f50b192b9 Jing Zhang 2021-04-23  157  	STATS_DESC_COUNTER("instruction=
_sigp_arch"),
98e35f50b192b9 Jing Zhang 2021-04-23  158  	STATS_DESC_COUNTER("instruction=
_sigp_prefix"),
98e35f50b192b9 Jing Zhang 2021-04-23  159  	STATS_DESC_COUNTER("instruction=
_sigp_restart"),
98e35f50b192b9 Jing Zhang 2021-04-23  160  	STATS_DESC_COUNTER("instruction=
_sigp_init_cpu_reset"),
98e35f50b192b9 Jing Zhang 2021-04-23  161  	STATS_DESC_COUNTER("instruction=
_sigp_cpu_reset"),
98e35f50b192b9 Jing Zhang 2021-04-23  162  	STATS_DESC_COUNTER("instruction=
_sigp_unknown"),
98e35f50b192b9 Jing Zhang 2021-04-23  163  	STATS_DESC_COUNTER("diagnose_10=
"),
98e35f50b192b9 Jing Zhang 2021-04-23  164  	STATS_DESC_COUNTER("diagnose_44=
"),
98e35f50b192b9 Jing Zhang 2021-04-23  165  	STATS_DESC_COUNTER("diagnose_9c=
"),
98e35f50b192b9 Jing Zhang 2021-04-23  166  	STATS_DESC_COUNTER("diagnose_9c=
_ignored"),
98e35f50b192b9 Jing Zhang 2021-04-23  167  	STATS_DESC_COUNTER("diagnose_25=
8"),
98e35f50b192b9 Jing Zhang 2021-04-23  168  	STATS_DESC_COUNTER("diagnose_30=
8"),
98e35f50b192b9 Jing Zhang 2021-04-23  169  	STATS_DESC_COUNTER("diagnose_50=
0"),
98e35f50b192b9 Jing Zhang 2021-04-23  170  	STATS_DESC_COUNTER("diagnose_ot=
her"),
98e35f50b192b9 Jing Zhang 2021-04-23  171  	STATS_DESC_COUNTER("pfault_sync=
"),
98e35f50b192b9 Jing Zhang 2021-04-23  172  };
98e35f50b192b9 Jing Zhang 2021-04-23  173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3811746775862123593==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
KTs+wkA7auTYe5AGD7v0zdz/AERSKo9A8AAA
--===============3811746775862123593==--

