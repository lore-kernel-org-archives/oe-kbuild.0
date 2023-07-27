Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B11CA1A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 21:50:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbb07e7155so30345e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690494639; x=1691099439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI0/6vL/m7bgkzyt2vUFGujFlbsSfvpOKZPzorAEEyc=;
        b=0kz+ihkRydomSiHYc/gqMT7X2ms0VTHByJFGQ4RQj8hkFkpKQP7o6/1QtH0V0BiWAk
         RlVEE557QqVqm4RQPjBU8Uev3dPTt6F1cLYc/ujNkpvLM7jQ/a9qoal64j1fFUKNF9WP
         DoratLgAjK1SMzE2m18+o15Nq0jR5Sj9nWujMmkjp2LsO3sc43PxhtBcU6Z62g9TS2jb
         iqBZj7Fcpsjo31xHFJFkqKUkQtNgAd/AoNKhyzroEIpBIK2bEKKMaps15vYK97gf/py/
         Jb+AdcGFiu2OCPJJSrhIYalDBVHCkEVDN63hQoWxNioC30Wxc04ndbA1seszNSbTAw8j
         gA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690494639; x=1691099439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI0/6vL/m7bgkzyt2vUFGujFlbsSfvpOKZPzorAEEyc=;
        b=VKsIGoXXPcz5G7p4PQM8HdVt38yb4rkbj1v9fCfM6AV30yHEagZ1WRrdhY36qlWlCP
         IYDvTHN1Z+lsl5fZlj248chR6YIKSilEX1DUAzQGWJfcHL6LieJevyewFns3fOiA4thU
         SQ8v92A2ZcOjSlw31Ktwf1SfqFCoqlVmq8qyrMaRuyGttkyJwFr9/gRBvVXpVJwZWXfc
         y2AnTb4qXk2JOicVlcnj5GGAK8Hh+3QJJnIzquA8gcQ7r0ips9uOllpLVVxitoCwQiVc
         rE7hMy78A1f9Kfk3ZxsGFs33gNUaq+0LzOUB6vRO099L88cH9J0TwdYQWN+Q1SRuy0JD
         PesQ==
X-Gm-Message-State: ABy/qLZy0EkbkhAgyGi9b39LiILkLYmTZxF9qKrAOMmf9a4EC9ehw7Ip
	D66HbBR7nvHujEc3jqVCWB26/Phg//uIj3Rn2n7rNw==
X-Google-Smtp-Source: APBJJlEpi+j4SuzDxnrOmvVKFnq/Z9MusBXqaHl8J/+/7mrzDnD23tMUwzWnawJa3x4Qy5qvDHDfabEcDJvd5zXN7jM=
X-Received: by 2002:a05:600c:4753:b0:3f6:f4b:d4a6 with SMTP id
 w19-20020a05600c475300b003f60f4bd4a6mr16057wmo.7.1690494639171; Thu, 27 Jul
 2023 14:50:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725212522.1622716-5-rmoar@google.com> <3cfb0706-0873-4839-b6e1-e8f1c994d6a6@kadam.mountain>
In-Reply-To: <3cfb0706-0873-4839-b6e1-e8f1c994d6a6@kadam.mountain>
From: Rae Moar <rmoar@google.com>
Date: Thu, 27 Jul 2023 17:50:26 -0400
Message-ID: <CA+GJov4m=Rh4g8RxhK+Aq+grJK6yZvghEn_B2NXqCOuq_eDvxw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] kunit: Add ability to filter attributes
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 1:12=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Rae,
>
> kernel test robot noticed the following build warnings:
>

Hello!

Sorry for this bug. It looks like I have a few uninitialized
variables. I am going to send out a fix for this in the next day or
so.

> url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add=
-test-attributes-API-structure/20230726-052754
> base:   64bd4641310c41a1ecf07c13c67bc0ed61045dfd
> patch link:    https://lore.kernel.org/r/20230725212522.1622716-5-rmoar%4=
0google.com
> patch subject: [PATCH v3 4/9] kunit: Add ability to filter attributes
> config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/=
archive/20230727/202307270610.s0w4NKEn-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270610=
.s0w4NKEn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202307270610.s0w4NKEn-lkp@intel.com/
>
> New smatch warnings:
> lib/kunit/attributes.c:127 attr_enum_filter() error: uninitialized symbol=
 'input_int'.
> lib/kunit/attributes.c:262 kunit_get_filter_count() error: uninitialized =
symbol 'comma_index'.
> lib/kunit/attributes.c:284 kunit_next_attr_filter() error: uninitialized =
symbol 'comma_index'.
> lib/kunit/executor.c:168 kunit_filter_suites() error: uninitialized symbo=
l 'filter_count'.
> lib/kunit/executor.c:171 kunit_filter_suites() error: uninitialized symbo=
l 'parsed_filters'.

I'll initialize filter_count as 0. I'll also initialize parsed_filters
as NULL and add an extra check for parsed_filters.

>
> Old smatch warnings:
> lib/kunit/attributes.c:267 kunit_get_filter_count() error: uninitialized =
symbol 'comma_index'.
> lib/kunit/executor.c:201 kunit_filter_suites() error: uninitialized symbo=
l 'filter_count'.
> lib/kunit/executor.c:202 kunit_filter_suites() error: uninitialized symbo=
l 'parsed_filters'.
>
> vim +/input_int +127 lib/kunit/attributes.c
>
> 793862a3f94d2f Rae Moar 2023-07-25  102  static int attr_enum_filter(void=
 *attr, const char *input, int *err,
> 793862a3f94d2f Rae Moar 2023-07-25  103                 const char * cons=
t str_list[], int max)
> 793862a3f94d2f Rae Moar 2023-07-25  104  {
> 793862a3f94d2f Rae Moar 2023-07-25  105         int i, j, input_int;
>                                                           ^^^^^^^^^
>
> 793862a3f94d2f Rae Moar 2023-07-25  106         long test_val =3D (long)a=
ttr;
> 793862a3f94d2f Rae Moar 2023-07-25  107         const char *input_val =3D=
 NULL;
> 793862a3f94d2f Rae Moar 2023-07-25  108
> 793862a3f94d2f Rae Moar 2023-07-25  109         for (i =3D 0; input[i]; i=
++) {
> 793862a3f94d2f Rae Moar 2023-07-25  110                 if (!strchr(op_li=
st, input[i])) {
> 793862a3f94d2f Rae Moar 2023-07-25  111                         input_val=
 =3D input + i;
> 793862a3f94d2f Rae Moar 2023-07-25  112                         break;
> 793862a3f94d2f Rae Moar 2023-07-25  113                 }
> 793862a3f94d2f Rae Moar 2023-07-25  114         }
> 793862a3f94d2f Rae Moar 2023-07-25  115
> 793862a3f94d2f Rae Moar 2023-07-25  116         if (!input_val) {
> 793862a3f94d2f Rae Moar 2023-07-25  117                 *err =3D -EINVAL;
> 793862a3f94d2f Rae Moar 2023-07-25  118                 pr_err("kunit exe=
cutor: filter value not found: %s\n", input);
> 793862a3f94d2f Rae Moar 2023-07-25  119                 return false;
> 793862a3f94d2f Rae Moar 2023-07-25  120         }
> 793862a3f94d2f Rae Moar 2023-07-25  121
> 793862a3f94d2f Rae Moar 2023-07-25  122         for (j =3D 0; j <=3D max;=
 j++) {
> 793862a3f94d2f Rae Moar 2023-07-25  123                 if (!strcmp(input=
_val, str_list[j]))
> 793862a3f94d2f Rae Moar 2023-07-25  124                         input_int=
 =3D j;
> 793862a3f94d2f Rae Moar 2023-07-25  125         }
> 793862a3f94d2f Rae Moar 2023-07-25  126
> 793862a3f94d2f Rae Moar 2023-07-25 @127         if (!input_int) {
>
> This is a bug, but wait, what?  Why is the first element invalid?  Maybe
> do:
>         int input_int =3D -1;
>
>         for (j =3D 0; j <=3D max; j++) {
>                 if found
>                         input_int =3D j;
>         }
>
>         if (input_int =3D=3D -1) {
>

What you have above looks like a great change.

> 793862a3f94d2f Rae Moar 2023-07-25  128                 *err =3D -EINVAL;
> 793862a3f94d2f Rae Moar 2023-07-25  129                 pr_err("kunit exe=
cutor: invalid filter input: %s\n", input);
> 793862a3f94d2f Rae Moar 2023-07-25  130                 return false;
> 793862a3f94d2f Rae Moar 2023-07-25  131         }
> 793862a3f94d2f Rae Moar 2023-07-25  132
> 793862a3f94d2f Rae Moar 2023-07-25  133         return int_filter(test_va=
l, input, input_int, err);
> 793862a3f94d2f Rae Moar 2023-07-25  134  }
>
> [ snip ]
>
> 793862a3f94d2f Rae Moar 2023-07-25  256  int kunit_get_filter_count(char =
*input)
> 793862a3f94d2f Rae Moar 2023-07-25  257  {
> 793862a3f94d2f Rae Moar 2023-07-25  258         int i, comma_index, count=
 =3D 0;
> 793862a3f94d2f Rae Moar 2023-07-25  259
> 793862a3f94d2f Rae Moar 2023-07-25  260         for (i =3D 0; input[i]; i=
++) {
> 793862a3f94d2f Rae Moar 2023-07-25  261                 if (input[i] =3D=
=3D ',') {
> 793862a3f94d2f Rae Moar 2023-07-25 @262                         if ((i - =
comma_index) > 1)
>
> initialize comma_index =3D 0

I will change this to be initialized to 0.

>
> 793862a3f94d2f Rae Moar 2023-07-25  263                                 c=
ount++;
> 793862a3f94d2f Rae Moar 2023-07-25  264                         comma_ind=
ex =3D i;
> 793862a3f94d2f Rae Moar 2023-07-25  265                 }
> 793862a3f94d2f Rae Moar 2023-07-25  266         }
> 793862a3f94d2f Rae Moar 2023-07-25  267         if ((i - comma_index) > 0=
)
> 793862a3f94d2f Rae Moar 2023-07-25  268                 count++;
> 793862a3f94d2f Rae Moar 2023-07-25  269         return count;
> 793862a3f94d2f Rae Moar 2023-07-25  270  }
> 793862a3f94d2f Rae Moar 2023-07-25  271
> 793862a3f94d2f Rae Moar 2023-07-25  272  struct kunit_attr_filter kunit_n=
ext_attr_filter(char **filters, int *err)
> 793862a3f94d2f Rae Moar 2023-07-25  273  {
> 793862a3f94d2f Rae Moar 2023-07-25  274         struct kunit_attr_filter =
filter =3D {};
> 793862a3f94d2f Rae Moar 2023-07-25  275         int i, j, comma_index, ne=
w_start_index;
> 793862a3f94d2f Rae Moar 2023-07-25  276         int op_index =3D -1, attr=
_index =3D -1;
> 793862a3f94d2f Rae Moar 2023-07-25  277         char op;
> 793862a3f94d2f Rae Moar 2023-07-25  278         char *input =3D *filters;
> 793862a3f94d2f Rae Moar 2023-07-25  279
> 793862a3f94d2f Rae Moar 2023-07-25  280         /* Parse input until oper=
ation */
> 793862a3f94d2f Rae Moar 2023-07-25  281         for (i =3D 0; input[i]; i=
++) {
> 793862a3f94d2f Rae Moar 2023-07-25  282                 if (op_index < 0 =
&& strchr(op_list, input[i])) {
> 793862a3f94d2f Rae Moar 2023-07-25  283                         op_index =
=3D i;
> 793862a3f94d2f Rae Moar 2023-07-25 @284                 } else if (!comma=
_index && input[i] =3D=3D ',') {
>
> same

I will also change this here.

>
> 793862a3f94d2f Rae Moar 2023-07-25  285                         comma_ind=
ex =3D i;
> 793862a3f94d2f Rae Moar 2023-07-25  286                 } else if (comma_=
index && input[i] !=3D ' ') {
> 793862a3f94d2f Rae Moar 2023-07-25  287                         new_start=
_index =3D i;
> 793862a3f94d2f Rae Moar 2023-07-25  288                         break;
> 793862a3f94d2f Rae Moar 2023-07-25  289                 }
> 793862a3f94d2f Rae Moar 2023-07-25  290         }
> 793862a3f94d2f Rae Moar 2023-07-25  291
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
