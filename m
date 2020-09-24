Content-Type: multipart/mixed; boundary="===============8243548236699692920=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 bpf-next 2/6] bpf: move to generic BTF show support, apply it to seq files/strings
Date: Fri, 25 Sep 2020 00:03:15 +0800
Message-ID: <202009242331.gTRthVHI%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8243548236699692920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1600883188-4831-3-git-send-email-alan.maguire@oracle.com>
References: <1600883188-4831-3-git-send-email-alan.maguire@oracle.com>
TO: Alan Maguire <alan.maguire@oracle.com>
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andriin(a)fb.com
TO: yhs(a)fb.com
CC: linux(a)rasmusvillemoes.dk
CC: andriy.shevchenko(a)linux.intel.com
CC: pmladek(a)suse.com
CC: kafai(a)fb.com
CC: songliubraving(a)fb.com
CC: john.fastabend(a)gmail.com

Hi Alan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Alan-Maguire/bpf-add-helpe=
rs-to-support-BTF-based-kernel-data-display/20200924-015115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/bpf/btf.c:4438:38: warning: Either the condition 't?btf_type_vlen=
(t):5' is redundant or there is pointer arithmetic with NULL pointer. [null=
PointerArithmeticRedundantCheck]
    args =3D (const struct btf_param *)(t + 1);
                                        ^
   kernel/bpf/btf.c:4440:14: note: Assuming that condition 't?btf_type_vlen=
(t):5' is not redundant
    nr_args =3D t ? btf_type_vlen(t) : 5;
                ^
   kernel/bpf/btf.c:4438:38: note: Null pointer addition
    args =3D (const struct btf_param *)(t + 1);
                                        ^
>> kernel/bpf/btf.c:831:4: warning: Variable 't' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    t =3D btf_type_by_id(show->btf, id);
      ^
   kernel/bpf/btf.c:799:0: note: Variable 't' is reassigned a value before =
the old one has been used.
    const struct btf_type *t =3D show->state.type;
   ^
   kernel/bpf/btf.c:831:4: note: Variable 't' is reassigned a value before =
the old one has been used.
    t =3D btf_type_by_id(show->btf, id);
      ^
   kernel/bpf/btf.c:4296:9: warning: Local variable btf_id shadows outer fu=
nction [shadowFunction]
    int i, btf_id;
           ^
   kernel/bpf/btf.c:5526:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:4296:9: note: Shadow variable
    int i, btf_id;
           ^
   kernel/bpf/btf.c:5084:6: warning: Local variable btf_id shadows outer fu=
nction [shadowFunction]
    u32 btf_id =3D 0;
        ^
   kernel/bpf/btf.c:5526:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5084:6: note: Shadow variable
    u32 btf_id =3D 0;
        ^
   kernel/bpf/btf.c:5117:16: warning: Local variable btf_id shadows outer f=
unction [shadowFunction]
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5526:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5117:16: note: Shadow variable
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5215:16: warning: Local variable btf_id shadows outer f=
unction [shadowFunction]
    u32 i, nargs, btf_id;
                  ^
   kernel/bpf/btf.c:5526:5: note: Shadowed declaration
   u32 btf_id(const struct btf *btf)
       ^
   kernel/bpf/btf.c:5215:16: note: Shadow variable
    u32 i, nargs, btf_id;
                  ^
>> kernel/bpf/btf.c:4200:5: warning: union member 'Anonymous2::__t' is neve=
r used. [unusedStructMember]
    } *__t;
       ^

# https://github.com/0day-ci/linux/commit/f8bb50c0c9cdac7a730f35d0e579c25d0=
bc3947f
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Alan-Maguire/bpf-add-helpers-to-support-BT=
F-based-kernel-data-display/20200924-015115
git checkout f8bb50c0c9cdac7a730f35d0e579c25d0bc3947f
vim +/t +831 kernel/bpf/btf.c

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  782  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  783  /*
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  784   * Populate show->state.name =
with type name information.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  785   * Format of type name is
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  786   *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  787   * [.member_name =3D ] (type_=
name)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  788   */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  789  static inline const char *btf=
_show_name(struct btf_show *show)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  790  {
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  791  	/* BTF_MAX_ITER array suffix=
es "[]" */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  792  	const char *array_suffixes =
=3D "[][][][][][][][][][]";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  793  	const char *array_suffix =3D=
 &array_suffixes[strlen(array_suffixes)];
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  794  	/* BTF_MAX_ITER pointer suff=
ixes "*" */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  795  	const char *ptr_suffixes =3D=
 "**********";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  796  	const char *ptr_suffix =3D &=
ptr_suffixes[strlen(ptr_suffixes)];
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  797  	const char *name =3D NULL, *=
prefix =3D "", *parens =3D "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  798  	const struct btf_member *m =
=3D show->state.member;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  799  	const struct btf_type *t =3D=
 show->state.type;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  800  	const struct btf_array *arra=
y;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  801  	u32 id =3D show->state.type_=
id;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  802  	const char *member =3D NULL;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  803  	bool show_member =3D false;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  804  	u64 kinds =3D 0;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  805  	int i;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  806  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  807  	show->state.name[0] =3D '\0';
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  808  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  809  	/*
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  810  	 * Don't show type name if w=
e're showing an array member;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  811  	 * in that case we show the =
array type so don't need to repeat
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  812  	 * ourselves for each member.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  813  	 */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  814  	if (show->state.array_member)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  815  		return "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  816  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  817  	/* Retrieve member name, if =
any. */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  818  	if (m) {
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  819  		member =3D btf_name_by_offs=
et(show->btf, m->name_off);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  820  		show_member =3D strlen(memb=
er) > 0;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  821  		id =3D m->type;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  822  	}
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  823  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  824  	/*
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  825  	 * Start with type_id, as we=
 have resolved the struct btf_type *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  826  	 * via btf_modifier_show() p=
ast the parent typedef to the child
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  827  	 * struct, int etc it is def=
ined as.  In such cases, the type_id
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  828  	 * still represents the star=
ting type while the struct btf_type *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  829  	 * in our show->state points=
 at the resolved type of the typedef.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  830  	 */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23 @831  	t =3D btf_type_by_id(show->b=
tf, id);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  832  	if (!t)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  833  		return "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  834  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  835  	/*
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  836  	 * The goal here is to build=
 up the right number of pointer and
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  837  	 * array suffixes while ensu=
ring the type name for a typedef
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  838  	 * is represented.  Along th=
e way we accumulate a list of
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  839  	 * BTF kinds we have encount=
ered, since these will inform later
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  840  	 * display; for example, poi=
nter types will not require an
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  841  	 * opening "{" for struct, w=
e will just display the pointer value.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  842  	 *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  843  	 * We also want to accumulat=
e the right number of pointer or array
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  844  	 * indices in the format str=
ing while iterating until we get to
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  845  	 * the typedef/pointee/array=
 member target type.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  846  	 *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  847  	 * We start by pointing at t=
he end of pointer and array suffix
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  848  	 * strings; as we accumulate=
 pointers and arrays we move the pointer
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  849  	 * or array string backwards=
 so it will show the expected number of
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  850  	 * '*' or '[]' for the type.=
  BTF_SHOW_MAX_ITER of nesting of pointers
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  851  	 * and/or arrays and typedef=
s are supported as a precaution.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  852  	 *
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  853  	 * We also want to get typed=
ef name while proceeding to resolve
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  854  	 * type it points to so that=
 we can add parentheses if it is a
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  855  	 * "typedef struct" etc.
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  856  	 */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  857  	for (i =3D 0; i < BTF_SHOW_M=
AX_ITER; i++) {
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  858  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  859  		switch (BTF_INFO_KIND(t->in=
fo)) {
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  860  		case BTF_KIND_TYPEDEF:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  861  			if (!name)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  862  				name =3D btf_name_by_offs=
et(show->btf,
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  863  							       t->name_off);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  864  			kinds |=3D BTF_KIND_BIT(BT=
F_KIND_TYPEDEF);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  865  			id =3D t->type;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  866  			break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  867  		case BTF_KIND_ARRAY:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  868  			kinds |=3D BTF_KIND_BIT(BT=
F_KIND_ARRAY);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  869  			parens =3D "[";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  870  			if (!t)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  871  				return "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  872  			array =3D btf_type_array(t=
);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  873  			if (array_suffix > array_s=
uffixes)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  874  				array_suffix -=3D 2;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  875  			id =3D array->type;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  876  			break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  877  		case BTF_KIND_PTR:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  878  			kinds |=3D BTF_KIND_BIT(BT=
F_KIND_PTR);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  879  			if (ptr_suffix > ptr_suffi=
xes)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  880  				ptr_suffix -=3D 1;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  881  			id =3D t->type;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  882  			break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  883  		default:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  884  			id =3D 0;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  885  			break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  886  		}
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  887  		if (!id)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  888  			break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  889  		t =3D btf_type_skip_qualifi=
ers(show->btf, id);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  890  	}
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  891  	/* We may not be able to rep=
resent this type; bail to be safe */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  892  	if (i =3D=3D BTF_SHOW_MAX_IT=
ER)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  893  		return "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  894  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  895  	if (!name)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  896  		name =3D btf_name_by_offset=
(show->btf, t->name_off);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  897  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  898  	switch (BTF_INFO_KIND(t->inf=
o)) {
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  899  	case BTF_KIND_STRUCT:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  900  	case BTF_KIND_UNION:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  901  		prefix =3D BTF_INFO_KIND(t-=
>info) =3D=3D BTF_KIND_STRUCT ?
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  902  			 "struct" : "union";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  903  		/* if it's an array of stru=
ct/union, parens is already set */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  904  		if (!(kinds & (BTF_KIND_BIT=
(BTF_KIND_ARRAY))))
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  905  			parens =3D "{";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  906  		break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  907  	case BTF_KIND_ENUM:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  908  		prefix =3D "enum";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  909  		break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  910  	default:
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  911  		break;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  912  	}
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  913  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  914  	/* pointer does not require =
parens */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  915  	if (kinds & BTF_KIND_BIT(BTF=
_KIND_PTR))
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  916  		parens =3D "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  917  	/* typedef does not require =
struct/union/enum prefix */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  918  	if (kinds & BTF_KIND_BIT(BTF=
_KIND_TYPEDEF))
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  919  		prefix =3D "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  920  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  921  	if (!name)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  922  		name =3D "";
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  923  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  924  	/* Even if we don't want typ=
e name info, we want parentheses etc */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  925  	if (show->flags & BTF_SHOW_N=
ONAME)
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  926  		snprintf(show->state.name, =
sizeof(show->state.name), "%s",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  927  			 parens);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  928  	else
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  929  		snprintf(show->state.name, =
sizeof(show->state.name),
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  930  			 "%s%s%s(%s%s%s%s%s%s)%s",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  931  			 /* first 3 strings compri=
se ".member =3D " */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  932  			 show_member ? "." : "",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  933  			 show_member ? member : "",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  934  			 show_member ? " =3D " : "=
",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  935  			 /* ...next is our prefix =
(struct, enum, etc) */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  936  			 prefix,
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  937  			 strlen(prefix) > 0 && str=
len(name) > 0 ? " " : "",
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  938  			 /* ...this is the type na=
me itself */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  939  			 name,
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  940  			 /* ...suffixed by the app=
ropriate '*', '[]' suffixes */
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  941  			 strlen(ptr_suffix) > 0 ? =
" " : "", ptr_suffix,
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  942  			 array_suffix, parens);
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  943  =

f8bb50c0c9cdac7 Alan Maguire 2020-09-23  944  	return show->state.name;
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  945  }
f8bb50c0c9cdac7 Alan Maguire 2020-09-23  946  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8243548236699692920==--

