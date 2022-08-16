Content-Type: multipart/mixed; boundary="===============6573882474186732441=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/microcode 1/2] htmldocs: Documentation/admin-guide/tainted-kernels.rst:143: WARNING: Block quote ends without a blank line; unexpected unindent.
Date: Tue, 16 Aug 2022 15:14:10 +0800
Message-ID: <202208161512.2Cr4Ai9h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6573882474186732441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ashok Raj <ashok.raj@intel.com>
CC: Borislav Petkov <bp@suse.de>
CC: linux-doc(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mic=
rocode
head:   71da8a554f25713964a919311c324e5a32f08239
commit: 35da8ad78e9b1a25d95a281966c439da1ef9a98a [1/2] x86/microcode: Docum=
ent the whole late loading problem
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/tainted-kernels.rst:143: WARNING: Block quote =
ends without a blank line; unexpected unindent.

vim +143 Documentation/admin-guide/tainted-kernels.rst

896dd323abbf6a Thorsten Leemhuis         2019-01-08  111  =

896dd323abbf6a Thorsten Leemhuis         2019-01-08  112   0)  ``G`` if all=
 modules loaded have a GPL or compatible license, ``P`` if
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  113       any propriet=
ary module has been loaded.  Modules without a
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  114       MODULE_LICEN=
SE or with a MODULE_LICENSE that is not recognised by
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  115       insmod as GP=
L compatible are assumed to be proprietary.
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  116  =

896dd323abbf6a Thorsten Leemhuis         2019-01-08  117   1)  ``F`` if any=
 module was force loaded by ``insmod -f``, ``' '`` if all
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  118       modules were=
 loaded normally.
337c188dff4a85 Mauro Carvalho Chehab     2016-11-07  119  =

547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  120   2)  ``S`` if the=
 kernel is running on a processor or system that is out of
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  121       specificatio=
n: hardware has been put into an unsupported configuration,
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  122       therefore pr=
oper execution cannot be guaranteed.
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  123       Kernel will =
be tainted if, for example:
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  124  =

547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  125       - on x86: PA=
E is forced through forcepae on intel CPUs (such as Pentium M)
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  126         which do n=
ot report PAE but may have a functional implementation, an SMP
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  127         kernel is =
running on non officially capable SMP Athlon CPUs, MSRs are
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  128         being poke=
d at from userspace.
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  129       - on arm: ke=
rnel running on certain CPUs (such as Keystone 2) without
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  130         having cer=
tain kernel features enabled.
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  131       - on arm64: =
there are mismatched hardware features between CPUs, the
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  132         bootloader=
 has booted CPUs in different modes.
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  133       - certain dr=
ivers are being used on non supported architectures (such as
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  134         scsi/snic =
on something else than x86_64, scsi/ips on non
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  135         x86/x86_64=
/itanium, have broken firmware settings for the
547f574fd9d5e3 Mathieu Chouquet-Stringer 2020-12-02  136         irqchip/ir=
q-gic on arm64 ...).
35da8ad78e9b1a Ashok Raj                 2022-08-13  137       - x86/x86_64=
: Microcode late loading is dangerous and will result in
35da8ad78e9b1a Ashok Raj                 2022-08-13  138         tainting t=
he kernel. It requires that all CPUs rendezvous to make sure
35da8ad78e9b1a Ashok Raj                 2022-08-13  139         the update=
 happens when the system is as quiescent as possible. However,
35da8ad78e9b1a Ashok Raj                 2022-08-13  140         a higher p=
riority MCE/SMI/NMI can move control flow away from that
35da8ad78e9b1a Ashok Raj                 2022-08-13  141         rendezvous=
 and interrupt the update, which can be detrimental to the
35da8ad78e9b1a Ashok Raj                 2022-08-13  142         machine.
35da8ad78e9b1a Ashok Raj                 2022-08-13 @143  e

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6573882474186732441==--

