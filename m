Content-Type: multipart/mixed; boundary="===============5903813212055457963=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printk: Make linux/printk.h self-contained
Date: Fri, 12 Jun 2020 09:59:11 +0800
Message-ID: <202006120911.r401sqbn%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5903813212055457963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200611125144.GA2506@gondor.apana.org.au>
References: <20200611125144.GA2506@gondor.apana.org.au>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: Petr Mladek <pmladek@suse.com>
TO: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Herbert,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7 next-20200611]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Herbert-Xu/printk-Make-lin=
ux-printk-h-self-contained/20200611-205340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b29482fde649c72441d5478a4ea2c52c56d97a5e
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: powerpc-randconfig-s031-20200611 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dpowerpc CF=3D'-fdiagnostic-prefix -D__CHECK=
_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/ptrace.c:53:22: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:53:22: sparse:    struct task_struct *
   kernel/ptrace.c:53:22: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:196:9: sparse: sparse: incompatible types in comparison =
expression (different address spaces):
   kernel/ptrace.c:196:9: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:196:9: sparse:    struct task_struct *
   kernel/ptrace.c:241:44: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   kernel/ptrace.c:241:44: sparse:    struct task_struct [noderef] <asn:4> *
   kernel/ptrace.c:241:44: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/user.c:105:27: sparse: sparse: unknown field name in initializer
   kernel/user.c:105:27: sparse: sparse: unknown field name in initializer
   kernel/user.c:105:27: sparse: sparse: unknown field name in initializer
   include/linux/ratelimit.h:14:9: sparse: sparse: no member 'lock' in stru=
ct ratelimit_state
   include/linux/ratelimit.h:15:11: sparse: sparse: no member 'interval' in=
 struct ratelimit_state
   include/linux/ratelimit.h:16:11: sparse: sparse: no member 'burst' in st=
ruct ratelimit_state
   include/linux/ratelimit.h:40:11: sparse: sparse: no member 'flags' in st=
ruct ratelimit_state
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   arch/powerpc/kernel/signal_64.c:804:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_64.c:804:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_64.c:804:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_64.c:916:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_64.c:916:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_64.c:916:17: sparse: sparse: unknown field na=
me in initializer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   arch/powerpc/kernel/traps.c:312:16: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:312:16: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:312:16: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:1843:9: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:1843:9: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:1843:9: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:2299:9: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:2299:9: sparse: sparse: unknown field name i=
n initializer
   arch/powerpc/kernel/traps.c:2299:9: sparse: sparse: unknown field name i=
n initializer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   arch/powerpc/kernel/signal_32.c:843:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_32.c:843:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_32.c:843:17: sparse: sparse: unknown field na=
me in initializer
   arch/powerpc/kernel/signal_32.c:1100:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1100:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1100:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1295:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1295:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1295:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1371:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1371:17: sparse: sparse: unknown field n=
ame in initializer
   arch/powerpc/kernel/signal_32.c:1371:17: sparse: sparse: unknown field n=
ame in initializer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   arch/powerpc/kvm/book3s_emulate.c:847:17: sparse: sparse: unknown field =
name in initializer
   arch/powerpc/kvm/book3s_emulate.c:847:17: sparse: sparse: unknown field =
name in initializer
   arch/powerpc/kvm/book3s_emulate.c:847:17: sparse: sparse: unknown field =
name in initializer
   arch/powerpc/kvm/book3s_emulate.c:1012:17: sparse: sparse: unknown field=
 name in initializer
   arch/powerpc/kvm/book3s_emulate.c:1012:17: sparse: sparse: unknown field=
 name in initializer
   arch/powerpc/kvm/book3s_emulate.c:1012:17: sparse: sparse: unknown field=
 name in initializer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/sched/core.c:4506:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:4506:17: sparse:    struct task_struct *
   kernel/sched/core.c:4506:17: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/core.c:4705:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:4705:22: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/core.c:4705:22: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *
   kernel/sched/core.c:1388:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/core.c:1388:38: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/core.c:1388:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/sched/fair.c:5386:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5386:38: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/fair.c:5386:38: sparse:    struct task_struct *
   kernel/sched/fair.c:8582:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8582:22: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/fair.c:8582:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10692:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10692:22: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/fair.c:10692:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10825:30: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10825:30: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/fair.c:10825:30: sparse:    struct task_struct *
   kernel/sched/fair.c:5330:35: sparse: sparse: marked inline, but without =
a definition
   kernel/sched/sched.h:1803:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1803:9: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/sched/rt.c:912:70: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   kernel/sched/rt.c:912:70: sparse:    struct task_struct [noderef] <asn:4=
> *
   kernel/sched/rt.c:912:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2183:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2183:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2183:25: sparse:    struct task_struct [noderef] <asn:=
4> *
   kernel/sched/rt.c:1876:13: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:1876:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1876:13: sparse:    struct task_struct [noderef] <asn:=
4> *
   kernel/sched/rt.c:2300:46: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2300:46: sparse:    struct task_struct [noderef] <asn:=
4> *
   kernel/sched/rt.c:2300:46: sparse:    struct task_struct *
   kernel/sched/rt.c:2320:22: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   kernel/sched/rt.c:2320:22: sparse:    struct task_struct [noderef] <asn:=
4> *
   kernel/sched/rt.c:2320:22: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/sched/deadline.c:2059:13: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2059:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2059:13: sparse:    struct task_struct [noderef]=
 <asn:4> *
   kernel/sched/deadline.c:2186:25: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2186:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2186:25: sparse:    struct task_struct [noderef]=
 <asn:4> *
   kernel/sched/deadline.c:2385:22: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2385:22: sparse:    struct task_struct [noderef]=
 <asn:4> *
   kernel/sched/deadline.c:2385:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2404:46: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   kernel/sched/deadline.c:2404:46: sparse:    struct task_struct [noderef]=
 <asn:4> *
   kernel/sched/deadline.c:2404:46: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1657:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/sched.h:1657:25: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   kernel/sched/debug.c:435:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/debug.c:435:22: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/debug.c:435:22: sparse:    struct task_struct *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   net/ipv4/nexthop.c:1088:24: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   net/ipv4/nexthop.c:1088:24: sparse:    struct rb_node [noderef] <asn:4> *
   net/ipv4/nexthop.c:1088:24: sparse:    struct rb_node *
   include/linux/rbtree.h:84:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   include/linux/rbtree.h:84:9: sparse:    struct rb_node [noderef] <asn:4>=
 *
   include/linux/rbtree.h:84:9: sparse:    struct rb_node *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   drivers/char/random.c:475:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:475:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:475:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:477:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:477:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:477:9: sparse: sparse: unknown field name in initi=
alizer
   drivers/char/random.c:985:37: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:986:25: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:988:41: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:990:36: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:991:25: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:993:40: sparse: sparse: no member 'missed' in stru=
ct ratelimit_state
   drivers/char/random.c:1805:32: sparse: sparse: no member 'interval' in s=
truct ratelimit_state
   drivers/char/random.c:1806:33: sparse: sparse: no member 'interval' in s=
truct ratelimit_state
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/super.c:2326:31: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/super.c:2326:31: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/super.c:2326:31: sparse:    struct rcu_string *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/ctree.c:129:22: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/ctree.c:129:22: sparse:    struct extent_buffer [noderef] <asn:=
4> *
   fs/btrfs/ctree.c:129:22: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:1085:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/ctree.c:1085:17: sparse:    struct extent_buffer [noderef] <asn=
:4> *
   fs/btrfs/ctree.c:1085:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:1846:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/ctree.c:1846:17: sparse:    struct extent_buffer [noderef] <asn=
:4> *
   fs/btrfs/ctree.c:1846:17: sparse:    struct extent_buffer *
   fs/btrfs/ctree.c:3332:9: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/ctree.c:3332:9: sparse:    struct extent_buffer [noderef] <asn:=
4> *
   fs/btrfs/ctree.c:3332:9: sparse:    struct extent_buffer *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/extent-tree.c:4517:17: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:4517:17: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:4517:17: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5040:33: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5040:33: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5040:33: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5151:41: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5151:41: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5151:41: sparse: sparse: unknown field name in in=
itializer
   fs/btrfs/extent-tree.c:5187:9: sparse: sparse: unknown field name in ini=
tializer
   fs/btrfs/extent-tree.c:5187:9: sparse: sparse: unknown field name in ini=
tializer
   fs/btrfs/extent-tree.c:5187:9: sparse: sparse: unknown field name in ini=
tializer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/volumes.c:7336:9: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/volumes.c:7336:9: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/volumes.c:7336:9: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/volumes.c:7336:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:7336:9: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:7336:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7356:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:7356:9: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:7356:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:539:24: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:539:24: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:539:24: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:858:17: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:858:17: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:858:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:932:33: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:932:33: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:932:33: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:939:25: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:939:25: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:939:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:951:17: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:951:17: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:951:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:1012:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:1012:25: sparse:    struct rcu_string [noderef] <asn:=
4> *
   fs/btrfs/volumes.c:1012:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:2055:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:2055:17: sparse:    struct rcu_string [noderef] <asn:=
4> *
   fs/btrfs/volumes.c:2055:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:2539:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:2539:9: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:2539:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:4104:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:4104:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:4104:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6325:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/btrfs/volumes.c:6325:9: sparse:    struct rcu_string [noderef] <asn:4=
> *
   fs/btrfs/volumes.c:6325:9: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:6535:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6535:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6535:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6538:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6538:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:6538:17: sparse: sparse: unknown field name in initia=
lizer
   fs/btrfs/volumes.c:7242:17: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7242:17: sparse:    struct rcu_string [noderef] <asn:=
4> *
   fs/btrfs/volumes.c:7242:17: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7253:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7253:25: sparse:    struct rcu_string [noderef] <asn:=
4> *
   fs/btrfs/volumes.c:7253:25: sparse:    struct rcu_string *
   fs/btrfs/volumes.c:7267:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   fs/btrfs/volumes.c:7267:25: sparse:    struct rcu_string [noderef] <asn:=
4> *
   fs/btrfs/volumes.c:7267:25: sparse:    struct rcu_string *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/scrub.c:838:16: sparse: sparse: unknown field name in initializ=
er
   fs/btrfs/scrub.c:838:16: sparse: sparse: unknown field name in initializ=
er
   fs/btrfs/scrub.c:838:16: sparse: sparse: unknown field name in initializ=
er
   fs/btrfs/scrub.c:1180:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1180:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1180:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1180:25: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/scrub.c:1180:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:1189:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1189:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1189:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1189:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/scrub.c:1189:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:1563:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1563:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:1563:25: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:703:17: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string [noderef] <asn:4> *
   fs/btrfs/scrub.c:703:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:717:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string [noderef] <asn:4> *
   fs/btrfs/scrub.c:717:9: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:775:25: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string [noderef] <asn:4> *
   fs/btrfs/scrub.c:775:25: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:2136:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2136:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2136:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2136:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/scrub.c:2136:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:2143:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2143:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2143:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:2143:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:2143:17: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/scrub.c:2143:17: sparse:    struct rcu_string *
   fs/btrfs/scrub.c:3862:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:3862:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:3862:17: sparse: sparse: unknown field name in initiali=
zer
   fs/btrfs/scrub.c:3901:17: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/btrfs/scrub.c:3901:17: sparse:    struct rcu_string [noderef] <asn:4>=
 *
   fs/btrfs/scrub.c:3901:17: sparse:    struct rcu_string *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/qgroup.c:1927:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:1927:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:1927:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:1945:25: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:1945:25: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:1945:25: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:2039:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:2039:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:2039:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:3844:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:3844:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:3844:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:4008:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:4008:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/qgroup.c:4008:17: sparse: sparse: unknown field name in initial=
izer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/dev-replace.c:683:25: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   fs/btrfs/dev-replace.c:683:25: sparse:    struct rcu_string [noderef] <a=
sn:4> *
   fs/btrfs/dev-replace.c:683:25: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:700:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:700:9: sparse:    struct rcu_string [noderef] <as=
n:4> *
   fs/btrfs/dev-replace.c:700:9: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:279:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:279:9: sparse:    struct rcu_string [noderef] <as=
n:4> *
   fs/btrfs/dev-replace.c:279:9: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:431:24: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   fs/btrfs/dev-replace.c:431:24: sparse:    struct rcu_string [noderef] <a=
sn:4> *
   fs/btrfs/dev-replace.c:431:24: sparse:    struct rcu_string *
   fs/btrfs/dev-replace.c:493:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   fs/btrfs/dev-replace.c:493:9: sparse:    struct rcu_string [noderef] <as=
n:4> *
   fs/btrfs/dev-replace.c:493:9: sparse:    struct rcu_string *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/block-rsv.c:509:24: sparse: sparse: unknown field name in initi=
alizer
   fs/btrfs/block-rsv.c:509:24: sparse: sparse: unknown field name in initi=
alizer
   fs/btrfs/block-rsv.c:509:24: sparse: sparse: unknown field name in initi=
alizer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   fs/btrfs/reflink.c:581:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/reflink.c:581:17: sparse: sparse: unknown field name in initial=
izer
   fs/btrfs/reflink.c:581:17: sparse: sparse: unknown field name in initial=
izer
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noder=
ef] <asn:4> *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] <asn:4> *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [nodere=
f] <asn:4> *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   drivers/md/md-linear.c:61:16: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   drivers/md/md-linear.c:61:16: sparse:    void [noderef] <asn:4> *
   drivers/md/md-linear.c:61:16: sparse:    void *
   drivers/md/md-linear.c:219:19: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   drivers/md/md-linear.c:219:19: sparse:    void [noderef] <asn:4> *
   drivers/md/md-linear.c:219:19: sparse:    void *
   drivers/md/md-linear.c:224:9: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   drivers/md/md-linear.c:224:9: sparse:    void [noderef] <asn:4> *
   drivers/md/md-linear.c:224:9: sparse:    void *
--
>> include/linux/ratelimit_types.h:16:25: sparse: sparse: expected ; at end=
 of declaration
   include/linux/ratelimit_types.h:16:25: sparse: sparse: Expected } at end=
 of struct-union-enum-specifier
   include/linux/ratelimit_types.h:16:25: sparse: sparse: got lock
   include/linux/ratelimit_types.h:24:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/ratelimit_types.h:24:1: sparse: sparse: got }
   drivers/md/md-multipath.c:37:40: sparse: sparse: incompatible types in c=
omparison expression (different address spaces):
   drivers/md/md-multipath.c:37:40: sparse:    struct md_rdev [noderef] <as=
n:4> *
   drivers/md/md-multipath.c:37:40: sparse:    struct md_rdev *
   drivers/md/md-multipath.c:47:9: sparse: sparse: unknown field name in in=
itializer
   drivers/md/md-multipath.c:47:9: sparse: sparse: unknown field name in in=
itializer
   drivers/md/md-multipath.c:47:9: sparse: sparse: unknown field name in in=
itializer
   drivers/md/md-multipath.c:147:40: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   drivers/md/md-multipath.c:147:40: sparse:    struct md_rdev [noderef] <a=
sn:4> *
   drivers/md/md-multipath.c:147:40: sparse:    struct md_rdev *
   drivers/md/md-multipath.c:161:40: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   drivers/md/md-multipath.c:161:40: sparse:    struct md_rdev [noderef] <a=
sn:4> *
   drivers/md/md-multipath.c:161:40: sparse:    struct md_rdev *
   drivers/md/md-multipath.c:261:25: sparse: sparse: incompatible types in =
comparison expression (different address spaces):
   drivers/md/md-multipath.c:261:25: sparse:    struct md_rdev [noderef] <a=
sn:4> *
   drivers/md/md-multipath.c:261:25: sparse:    struct md_rdev *

# https://github.com/0day-ci/linux/commit/17b41842ecf70ea595220b384e6380d29=
c39b555
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 17b41842ecf70ea595220b384e6380d29c39b555
vim +16 include/linux/ratelimit_types.h

17b41842ecf70e Herbert Xu 2020-06-11  14  =

17b41842ecf70e Herbert Xu 2020-06-11  15  struct ratelimit_state {
17b41842ecf70e Herbert Xu 2020-06-11 @16  	raw_spinlock_t	lock;		/* protect=
 the state */
17b41842ecf70e Herbert Xu 2020-06-11  17  =

17b41842ecf70e Herbert Xu 2020-06-11  18  	int		interval;
17b41842ecf70e Herbert Xu 2020-06-11  19  	int		burst;
17b41842ecf70e Herbert Xu 2020-06-11  20  	int		printed;
17b41842ecf70e Herbert Xu 2020-06-11  21  	int		missed;
17b41842ecf70e Herbert Xu 2020-06-11  22  	unsigned long	begin;
17b41842ecf70e Herbert Xu 2020-06-11  23  	unsigned long	flags;
17b41842ecf70e Herbert Xu 2020-06-11  24  };
17b41842ecf70e Herbert Xu 2020-06-11  25  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5903813212055457963==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5903813212055457963==--

