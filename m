Content-Type: multipart/mixed; boundary="===============4227853658793092155=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
Subject: Re: [gustavoars-linux:for-next/testing 1/1] ./usr/include/rdma/ib_user_verbs.h:436:34: warning: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension
Date: Fri, 21 Feb 2020 16:50:07 +0800
Message-ID: <20200221085007.GF14818@intel.com>
In-Reply-To: <5c39ace2-394d-30cd-1572-118cade40fe1@embeddedor.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4227853658793092155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 01:16:02AM -0600, Gustavo A. R. Silva wrote:
> =

> =

> On 2/20/20 23:11, Nathan Chancellor wrote:
> > + Gustavo, since I assume the point of that patch is to see what kind of
> > warnings crop up?
> > =

> =

> Precisely! Thanks, Nathan. :)
> =

> I would have expected to get this e-mail automatically... could someone h=
elp
> me with that? I'd really appreciate it.
Hi Gustavo, 0-day ci is working on this to send clang build report directly=
 to
author in a few weeks.

> =

> Thanks
> --
> Gustavo
> =

> > On Fri, Feb 21, 2020 at 11:16:11AM +0800, kbuild test robot wrote:
> >> CC: kbuild-all(a)lists.01.org
> >> TO: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/lin=
ux.git for-next/testing
> >> head:   2d94fd162464e8b126227a996eaffa9e0442a1be
> >> commit: 2d94fd162464e8b126227a996eaffa9e0442a1be [1/1] treewide: Repla=
ce zero-length array with flexible-array member
> >> config: x86_64-allyesconfig (attached as .config)
> >> compiler: clang version 11.0.0 (git://gitmirror/llvm_project 9d37f5afa=
c4a3b9194b9001bed84f58ca8bd6c02)
> >> reproduce:
> >>         git checkout 2d94fd162464e8b126227a996eaffa9e0442a1be
> >>         # save the attached .config to linux build tree
> >>         make ARCH=3Dx86_64 =

> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    In file included from <built-in>:1:
> >>    In file included from ./usr/include/rdma/rdma_user_cm.h:40:
> >>>> ./usr/include/rdma/ib_user_verbs.h:436:34: warning: field 'base' wit=
h variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a=
 struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >>            struct ib_uverbs_create_cq_resp base;
> >>                                            ^
> >>>> ./usr/include/rdma/ib_user_verbs.h:647:34: warning: field 'base' wit=
h variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a=
 struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >>            struct ib_uverbs_create_qp_resp base;
> >>                                            ^
> >>>> ./usr/include/rdma/ib_user_verbs.h:743:29: warning: field 'base' wit=
h variable sized type 'struct ib_uverbs_modify_qp' not at the end of a stru=
ct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >>            struct ib_uverbs_modify_qp base;
> >>                                       ^
> >>    3 warnings generated.
> >>
> >> ---
> >> 0-DAY CI Kernel Test Service, Intel Corporation
> >> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >>
>=20
--===============4227853658793092155==--

