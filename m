Content-Type: multipart/mixed; boundary="===============6761025848620049888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/test-drivers/vidtv/vidtv_psi.c:432:62: warning: Same expression on both sides of '-' because 'sizeof(struct vidtv_psi_desc_service_list_entry)' and 'sizeof(struct represent the same value. [knownCondition...
Date: Tue, 01 Dec 2020 23:43:32 +0800
Message-ID: <202012012329.GwR78xnO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6761025848620049888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b65054597872ce3aefbc6a666385eabdf9e288da
commit: c2f78f0cb294aa6f009d3a170f4ee8ad199ba5da media: vidtv: psi: add a N=
etwork Information Table (NIT)
date:   5 days ago
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/test-drivers/vidtv/vidtv_psi.c:432:62: warning: Same expre=
ssion on both sides of '-' because 'sizeof(struct vidtv_psi_desc_service_li=
st_entry)' and 'sizeof(struct vidtv_psi_desc_service_list_entry*)' represen=
t the same value. [knownConditionTrueFalse]
     length +=3D sizeof(struct vidtv_psi_desc_service_list_entry) -
                                                                ^
   drivers/media/test-drivers/vidtv/vidtv_psi.c:676:68: warning: Same expre=
ssion on both sides of '-' because 'sizeof(struct vidtv_psi_desc_service_li=
st_entry)' and 'sizeof(struct vidtv_psi_desc_service_list_entry*)' represen=
t the same value. [knownConditionTrueFalse]
      psi_args.len =3D sizeof(struct vidtv_psi_desc_service_list_entry) -
                                                                      ^
>> drivers/media/test-drivers/vidtv/vidtv_psi.c:734:56: warning: Same expre=
ssion on both sides of '-' because 'sizeof(struct vidtv_psi_table_pat_progr=
am)' and 'sizeof(struct vidtv_psi_table_pat_program*)' represent the same v=
alue. [knownConditionTrueFalse]
     length +=3D sizeof(struct vidtv_psi_table_pat_program) -
                                                          ^

vim +432 drivers/media/test-drivers/vidtv/vidtv_psi.c

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  412  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  413  struct vidtv_psi_desc=
_service_list
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  414  *vidtv_psi_service_li=
st_desc_init(struct vidtv_psi_desc *head,
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  415  				  struct vidtv_ps=
i_desc_service_list_entry *entry)
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  416  {
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  417  	struct vidtv_psi_des=
c_service_list *desc;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  418  	struct vidtv_psi_des=
c_service_list_entry *curr_e =3D NULL;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  419  	struct vidtv_psi_des=
c_service_list_entry *head_e =3D NULL;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  420  	struct vidtv_psi_des=
c_service_list_entry *prev_e =3D NULL;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  421  	u16 length =3D 0;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  422  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  423  	desc =3D kzalloc(siz=
eof(*desc), GFP_KERNEL);
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  424  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  425  	desc->type =3D SERVI=
CE_LIST_DESCRIPTOR;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  426  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  427  	while (entry) {
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  428  		curr_e =3D kzalloc(=
sizeof(*curr_e), GFP_KERNEL);
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  429  		curr_e->service_id =
=3D entry->service_id;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  430  		curr_e->service_typ=
e =3D entry->service_type;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  431  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31 @432  		length +=3D sizeof(=
struct vidtv_psi_desc_service_list_entry) -
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  433  			  sizeof(struct vi=
dtv_psi_desc_service_list_entry *);
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  434  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  435  		if (!head_e)
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  436  			head_e =3D curr_e;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  437  		if (prev_e)
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  438  			prev_e->next =3D c=
urr_e;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  439  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  440  		prev_e =3D curr_e;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  441  		entry =3D entry->ne=
xt;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  442  	}
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  443  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  444  	desc->length =3D len=
gth;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  445  	desc->service_list =
=3D head_e;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  446  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  447  	if (head) {
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  448  		while (head->next)
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  449  			head =3D head->nex=
t;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  450  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  451  		head->next =3D (str=
uct vidtv_psi_desc *)desc;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  452  	}
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  453  =

c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  454  	return desc;
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  455  }
c2f78f0cb294aa6 Daniel W. S. Almeida 2020-10-31  456  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6761025848620049888==--

