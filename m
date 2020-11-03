Content-Type: multipart/mixed; boundary="===============8941981093366709191=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: sound/soc/codecs/wcd934x.c:1571:9: warning: Identical condition 'ret', second condition is always false
Date: Tue, 03 Nov 2020 13:57:13 +0300
Message-ID: <20201103105713.GC18329@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8941981093366709191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   b7cbaf59f62f8ab8f157698f9e31642bff525bd0
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/wcd934x.c:1571:9: warning: Identical condition 'ret', s=
econd condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   sound/soc/codecs/wcd934x.c:1568:6: note: first condition
    if (ret)
        ^
   sound/soc/codecs/wcd934x.c:1571:9: note: second condition
    return ret;
           ^

vim +/ret +1571 sound/soc/codecs/wcd934x.c

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1561  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1562  	ret =3D wcd934x_set_=
prim_interpolator_rate(dai, (u8)rate_val,
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1563  						 sample_rate);
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1564  	if (ret)
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1565  		return ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1566  	ret =3D wcd934x_set_=
mix_interpolator_rate(dai, (u8)rate_val,
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1567  						sample_rate);
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1568  	if (ret)
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1569  		return ret;
a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1570  =

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19 @1571  	return ret;
                                                        ^^^^^^^^^^^
Just "return 0;"

a61f3b4f476eceb Srinivas Kandagatla 2019-12-19  1572  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============8941981093366709191==--

