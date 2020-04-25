Content-Type: multipart/mixed; boundary="===============8596306684695141824=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [joro:sev-es-client-v5.7-rc2 44/74] arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant expression type
Date: Sun, 26 Apr 2020 06:31:10 +0800
Message-ID: <202004260653.7XgjyNqB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8596306684695141824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git sev-=
es-client-v5.7-rc2
head:   d145adbc6f48a45af59f5878a14d7ac5af86a707
commit: 21fd7de86f3a8c4fd2b66d5543e2d526f874143b [44/74] x86/dumpstack/64: =
Handle #VC exception stacks
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 21fd7de86f3a8c4fd2b66d5543e2d526f874143b
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
--
   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
--
   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
   arch/x86/kernel/traps.c:969:9: sparse: sparse: undefined identifier 'sev=
_es_init_vc_handling'
--
   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
>> arch/x86/kernel/dumpstack_32.c:23:18: sparse: sparse: incompatible types=
 for operation (=3D=3D):
>> arch/x86/kernel/dumpstack_32.c:23:18: sparse:    bad type enum stack_typ=
e type
>> arch/x86/kernel/dumpstack_32.c:23:18: sparse:    int
   arch/x86/kernel/dumpstack_32.c:26:18: sparse: sparse: incompatible types=
 for operation (=3D=3D):
   arch/x86/kernel/dumpstack_32.c:26:18: sparse:    bad type enum stack_typ=
e type
   arch/x86/kernel/dumpstack_32.c:26:18: sparse:    int
   arch/x86/kernel/dumpstack_32.c:29:18: sparse: sparse: incompatible types=
 for operation (=3D=3D):
   arch/x86/kernel/dumpstack_32.c:29:18: sparse:    bad type enum stack_typ=
e type
   arch/x86/kernel/dumpstack_32.c:29:18: sparse:    int
   arch/x86/kernel/dumpstack_32.c:32:18: sparse: sparse: incompatible types=
 for operation (=3D=3D):
   arch/x86/kernel/dumpstack_32.c:32:18: sparse:    bad type enum stack_typ=
e type
   arch/x86/kernel/dumpstack_32.c:32:18: sparse:    int
   arch/x86/kernel/dumpstack_32.c:147:40: sparse: sparse: incompatible type=
s for operation (<<):
>> arch/x86/kernel/dumpstack_32.c:147:40: sparse:    unsigned long
   arch/x86/kernel/dumpstack_32.c:147:40: sparse:    bad type enum stack_ty=
pe type
   arch/x86/kernel/dumpstack_32.c:151:36: sparse: sparse: incompatible type=
s for operation (<<):
   arch/x86/kernel/dumpstack_32.c:151:36: sparse:    unsigned long
   arch/x86/kernel/dumpstack_32.c:151:36: sparse:    bad type enum stack_ty=
pe type
--
   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
>> arch/x86/include/asm/stacktrace.h:48:28: sparse: sparse: incompatible ty=
pes for operation (!=3D):
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    bad type enum stack_=
type type
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    int
>> arch/x86/include/asm/stacktrace.h:48:28: sparse: sparse: incompatible ty=
pes for operation (!=3D):
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    bad type enum stack_=
type type
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    int
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
--
   arch/x86/include/asm/stacktrace.h:25:46: sparse: sparse: undefined ident=
ifier 'N_VC_STACKS'
>> arch/x86/include/asm/stacktrace.h:25:58: sparse: sparse: bad constant ex=
pression type
>> arch/x86/kernel/unwind_frame.c:230:54: sparse: sparse: incompatible type=
s for operation (=3D=3D):
>> arch/x86/kernel/unwind_frame.c:230:54: sparse:    bad type enum stack_ty=
pe type
>> arch/x86/kernel/unwind_frame.c:230:54: sparse:    bad type enum stack_ty=
pe prev_type
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
>> arch/x86/include/asm/stacktrace.h:48:28: sparse: sparse: incompatible ty=
pes for operation (!=3D):
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    bad type enum stack_=
type type
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    int
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
>> arch/x86/include/asm/unwind.h:46:39: sparse: sparse: incompatible types =
for operation (=3D=3D):
>> arch/x86/include/asm/unwind.h:46:39: sparse:    bad type enum stack_type=
 type
>> arch/x86/include/asm/unwind.h:46:39: sparse:    int
>> arch/x86/include/asm/stacktrace.h:48:28: sparse: sparse: incompatible ty=
pes for operation (!=3D):
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    bad type enum stack_=
type type
>> arch/x86/include/asm/stacktrace.h:48:28: sparse:    int

# https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/commit/?id=
=3D21fd7de86f3a8c4fd2b66d5543e2d526f874143b
git remote add joro https://git.kernel.org/pub/scm/linux/kernel/git/joro/li=
nux.git
git remote update joro
git checkout 21fd7de86f3a8c4fd2b66d5543e2d526f874143b
vim +25 arch/x86/include/asm/stacktrace.h

c9cf4dbb4d9ca7 Frederic Weisbecker 2010-05-19  15  =

cb76c939824042 Josh Poimboeuf      2016-09-14  16  enum stack_type {
cb76c939824042 Josh Poimboeuf      2016-09-14  17  	STACK_TYPE_UNKNOWN,
cb76c939824042 Josh Poimboeuf      2016-09-14  18  	STACK_TYPE_TASK,
cb76c939824042 Josh Poimboeuf      2016-09-14  19  	STACK_TYPE_IRQ,
cb76c939824042 Josh Poimboeuf      2016-09-14  20  	STACK_TYPE_SOFTIRQ,
4fe2d8b11a370a Dave Hansen         2017-12-04  21  	STACK_TYPE_ENTRY,
cb76c939824042 Josh Poimboeuf      2016-09-14  22  	STACK_TYPE_EXCEPTION,
cb76c939824042 Josh Poimboeuf      2016-09-14  23  	STACK_TYPE_EXCEPTION_LA=
ST =3D STACK_TYPE_EXCEPTION + N_EXCEPTION_STACKS-1,
21fd7de86f3a8c Joerg Roedel        2020-04-24  24  	STACK_TYPE_VC,
21fd7de86f3a8c Joerg Roedel        2020-04-24 @25  	STACK_TYPE_VC_LAST =3D =
STACK_TYPE_VC + N_VC_STACKS - 1,
cb76c939824042 Josh Poimboeuf      2016-09-14  26  };
cb76c939824042 Josh Poimboeuf      2016-09-14  27  =

cb76c939824042 Josh Poimboeuf      2016-09-14  28  struct stack_info {
cb76c939824042 Josh Poimboeuf      2016-09-14  29  	enum stack_type type;
cb76c939824042 Josh Poimboeuf      2016-09-14  30  	unsigned long *begin, *=
end, *next_sp;
cb76c939824042 Josh Poimboeuf      2016-09-14  31  };
cb76c939824042 Josh Poimboeuf      2016-09-14  32  =

cb76c939824042 Josh Poimboeuf      2016-09-14  33  bool in_task_stack(unsig=
ned long *stack, struct task_struct *task,
cb76c939824042 Josh Poimboeuf      2016-09-14  34  		   struct stack_info *=
info);
cb76c939824042 Josh Poimboeuf      2016-09-14  35  =

4fe2d8b11a370a Dave Hansen         2017-12-04  36  bool in_entry_stack(unsi=
gned long *stack, struct stack_info *info);
33a2f1a6c4d7c0 Andy Lutomirski     2017-12-04  37  =

cb76c939824042 Josh Poimboeuf      2016-09-14  38  int get_stack_info(unsig=
ned long *stack, struct task_struct *task,
cb76c939824042 Josh Poimboeuf      2016-09-14  39  		   struct stack_info *=
info, unsigned long *visit_mask);
cb76c939824042 Josh Poimboeuf      2016-09-14  40  =

3d02a9c48d479e Josh Poimboeuf      2016-11-18  41  const char *stack_type_n=
ame(enum stack_type type);
cb76c939824042 Josh Poimboeuf      2016-09-14  42  =

cb76c939824042 Josh Poimboeuf      2016-09-14  43  static inline bool on_st=
ack(struct stack_info *info, void *addr, size_t len)
cb76c939824042 Josh Poimboeuf      2016-09-14  44  {
cb76c939824042 Josh Poimboeuf      2016-09-14  45  	void *begin =3D info->b=
egin;
cb76c939824042 Josh Poimboeuf      2016-09-14  46  	void *end   =3D info->e=
nd;
cb76c939824042 Josh Poimboeuf      2016-09-14  47  =

cb76c939824042 Josh Poimboeuf      2016-09-14 @48  	return (info->type !=3D=
 STACK_TYPE_UNKNOWN &&
cb76c939824042 Josh Poimboeuf      2016-09-14  49  		addr >=3D begin && add=
r < end &&
cb76c939824042 Josh Poimboeuf      2016-09-14  50  		addr + len > begin && =
addr + len <=3D end);
cb76c939824042 Josh Poimboeuf      2016-09-14  51  }
cb76c939824042 Josh Poimboeuf      2016-09-14  52  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8596306684695141824==--

