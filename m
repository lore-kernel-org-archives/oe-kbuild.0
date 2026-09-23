Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B01932C94A
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127972; cv=none; b=GwO5E6CU3tMlY30TImQ0YjiATBoNU4VsIgXP4lC6cMCwF7Lg6obZNLuT+kp8qTnZhQ/V1k/sDpUBFwfdfB4n6tlpddxRxQ0SG7SgIIg33+icGfG82lBXSOJW2uvRkGZ4DrD5RRMKUefEe9xwd191OWqeuiODCanoJc3KETrhbZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127972; c=relaxed/simple;
	bh=tTkHTXscA4zDJjY1HUc/2RvsDD0ZE0OJe3lkVuCOQDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UGyCq9h1GMzYSQkrUzTEz8IvdU5+5GIxVlhrkrvU+320OQnBDkhrYZ6JQqewhyOkI1a8eNMUUkwirs7GqqR6RcRQTdopFaE0euTQDnWMUmd4iD3xsyQeTdfy7TYDDgUaUBZoMDiIszOLFqVlY/kYocGr8D172xMPHxY+g4b2p1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djsOKRYk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djsOKRYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790127970; x=1821663970;
  h=date:from:to:cc:subject:message-id;
  bh=tTkHTXscA4zDJjY1HUc/2RvsDD0ZE0OJe3lkVuCOQDQ=;
  b=djsOKRYkXW8xhYji1r/7b7PNdochL8d9bJa0o6pxyWu7g9JkNS/dyJOp
   hJWM7lbV48RSKBoEo+JRqa1TGqrtoL1uMW3wifFLjVFvTqhHSFLXM46My
   Wvniq1DA1/EcnehQvo/yeQi5ENE8wSPX8MQwjobZR91saVGi8/h/cJSxq
   08NZ+1F1hFUppRS9iJxtlPsxXOk65dWaIQEnY3J7ztWilAraepIAw6xiL
   cOdj0wkAhJTRp/1Yb50GQM0mB7wmW3kFo9pBBo7G49YdnaM1vBysX+y2u
   TL1GvgKlBsWk5Oy+ayHZMeZ8riiq108+oEBtytSI5qlIVEabyNweh8MJm
   A==;
X-CSE-ConnectionGUID: Tp1H217PSx6SRHFoAdfD9Q==
X-CSE-MsgGUID: rRxIPF2CRcCL8X9WA+XwIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94607352"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94607352"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 18:45:27 -0700
X-CSE-ConnectionGUID: iZZvFlEAT/WhVPht6vZE4g==
X-CSE-MsgGUID: 3P40X8KaRumYz5VA8u2LLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="278145255"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 18:45:11 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9C2n-000000000QF-1Fzi;
	Wed, 23 Sep 2026 01:45:09 +0000
Date: Wed, 23 Sep 2026 03:44:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rafael-pm:bleeding-edge 117/144]
 include/linux/cleanup.h:211:92: warning: suggest braces around empty body in
 an 'if' statement
Message-ID: <202609230301.pGomjVWp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-acpi@vger.kernel.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   acc982fd3f3140b46bfb3ee5989f02fb9a20ee4d
commit: a7cdc3143fd46d0fddfe9589421a77f39d57a828 [117/144] ACPI: fan: Use __free() to simplify AML error handling
:::::: branch date: 6 hours ago
:::::: commit date: 14 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260923/202609230301.pGomjVWp-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230301.pGomjVWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609230301.pGomjVWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/acpi.h:11,
                    from test/nfit_test.h:7,
                    from pmem-dax.c:5:
   include/linux/acpi.h: In function '__free_acpi_object_free':
>> include/linux/cleanup.h:211:92: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                                            ^
   include/linux/acpi.h:30:1: note: in expansion of macro 'DEFINE_FREE'
      30 | DEFINE_FREE(acpi_object_free, union acpi_object *, if (_T) ACPI_FREE(_T));
         | ^~~~~~~~~~~


vim +/if +211 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra 2023-05-26    8  
d5934e76316e84 Dan Williams   2024-03-29    9  /**
d5934e76316e84 Dan Williams   2024-03-29   10   * DOC: scope-based cleanup helpers
d5934e76316e84 Dan Williams   2024-03-29   11   *
d5934e76316e84 Dan Williams   2024-03-29   12   * The "goto error" pattern is notorious for introducing subtle resource
d5934e76316e84 Dan Williams   2024-03-29   13   * leaks. It is tedious and error prone to add new resource acquisition
d5934e76316e84 Dan Williams   2024-03-29   14   * constraints into code paths that already have several unwind
d5934e76316e84 Dan Williams   2024-03-29   15   * conditions. The "cleanup" helpers enable the compiler to help with
d5934e76316e84 Dan Williams   2024-03-29   16   * this tedium and can aid in maintaining LIFO (last in first out)
d5934e76316e84 Dan Williams   2024-03-29   17   * unwind ordering to avoid unintentional leaks.
d5934e76316e84 Dan Williams   2024-03-29   18   *
d5934e76316e84 Dan Williams   2024-03-29   19   * As drivers make up the majority of the kernel code base, here is an
d5934e76316e84 Dan Williams   2024-03-29   20   * example of using these helpers to clean up PCI drivers. The target of
d5934e76316e84 Dan Williams   2024-03-29   21   * the cleanups are occasions where a goto is used to unwind a device
d5934e76316e84 Dan Williams   2024-03-29   22   * reference (pci_dev_put()), or unlock the device (pci_dev_unlock())
d5934e76316e84 Dan Williams   2024-03-29   23   * before returning.
d5934e76316e84 Dan Williams   2024-03-29   24   *
d5934e76316e84 Dan Williams   2024-03-29   25   * The DEFINE_FREE() macro can arrange for PCI device references to be
d5934e76316e84 Dan Williams   2024-03-29   26   * dropped when the associated variable goes out of scope::
d5934e76316e84 Dan Williams   2024-03-29   27   *
d5934e76316e84 Dan Williams   2024-03-29   28   *	DEFINE_FREE(pci_dev_put, struct pci_dev *, if (_T) pci_dev_put(_T))
d5934e76316e84 Dan Williams   2024-03-29   29   *	...
d5934e76316e84 Dan Williams   2024-03-29   30   *	struct pci_dev *dev __free(pci_dev_put) =
d5934e76316e84 Dan Williams   2024-03-29   31   *		pci_get_slot(parent, PCI_DEVFN(0, 0));
d5934e76316e84 Dan Williams   2024-03-29   32   *
d5934e76316e84 Dan Williams   2024-03-29   33   * The above will automatically call pci_dev_put() if @dev is non-NULL
d5934e76316e84 Dan Williams   2024-03-29   34   * when @dev goes out of scope (automatic variable scope). If a function
d5934e76316e84 Dan Williams   2024-03-29   35   * wants to invoke pci_dev_put() on error, but return @dev (i.e. without
d5934e76316e84 Dan Williams   2024-03-29   36   * freeing it) on success, it can do::
d5934e76316e84 Dan Williams   2024-03-29   37   *
d5934e76316e84 Dan Williams   2024-03-29   38   *	return no_free_ptr(dev);
d5934e76316e84 Dan Williams   2024-03-29   39   *
d5934e76316e84 Dan Williams   2024-03-29   40   * ...or::
d5934e76316e84 Dan Williams   2024-03-29   41   *
d5934e76316e84 Dan Williams   2024-03-29   42   *	return_ptr(dev);
d5934e76316e84 Dan Williams   2024-03-29   43   *
d5934e76316e84 Dan Williams   2024-03-29   44   * The DEFINE_GUARD() macro can arrange for the PCI device lock to be
d5934e76316e84 Dan Williams   2024-03-29   45   * dropped when the scope where guard() is invoked ends::
d5934e76316e84 Dan Williams   2024-03-29   46   *
d5934e76316e84 Dan Williams   2024-03-29   47   *	DEFINE_GUARD(pci_dev, struct pci_dev *, pci_dev_lock(_T), pci_dev_unlock(_T))
d5934e76316e84 Dan Williams   2024-03-29   48   *	...
d5934e76316e84 Dan Williams   2024-03-29   49   *	guard(pci_dev)(dev);
d5934e76316e84 Dan Williams   2024-03-29   50   *
d5934e76316e84 Dan Williams   2024-03-29   51   * The lifetime of the lock obtained by the guard() helper follows the
d5934e76316e84 Dan Williams   2024-03-29   52   * scope of automatic variable declaration. Take the following example::
d5934e76316e84 Dan Williams   2024-03-29   53   *
d5934e76316e84 Dan Williams   2024-03-29   54   *	func(...)
d5934e76316e84 Dan Williams   2024-03-29   55   *	{
d5934e76316e84 Dan Williams   2024-03-29   56   *		if (...) {
d5934e76316e84 Dan Williams   2024-03-29   57   *			...
d5934e76316e84 Dan Williams   2024-03-29   58   *			guard(pci_dev)(dev); // pci_dev_lock() invoked here
d5934e76316e84 Dan Williams   2024-03-29   59   *			...
d5934e76316e84 Dan Williams   2024-03-29   60   *		} // <- implied pci_dev_unlock() triggered here
d5934e76316e84 Dan Williams   2024-03-29   61   *	}
d5934e76316e84 Dan Williams   2024-03-29   62   *
d5934e76316e84 Dan Williams   2024-03-29   63   * Observe the lock is held for the remainder of the "if ()" block not
d5934e76316e84 Dan Williams   2024-03-29   64   * the remainder of "func()".
d5934e76316e84 Dan Williams   2024-03-29   65   *
857d18f23ab172 Peter Zijlstra 2025-07-11   66   * The ACQUIRE() macro can be used in all places that guard() can be
b2df55a98672f4 Dan Williams   2025-07-17   67   * used and additionally support conditional locks::
857d18f23ab172 Peter Zijlstra 2025-07-11   68   *
857d18f23ab172 Peter Zijlstra 2025-07-11   69   *	DEFINE_GUARD_COND(pci_dev, _try, pci_dev_trylock(_T))
857d18f23ab172 Peter Zijlstra 2025-07-11   70   *	...
857d18f23ab172 Peter Zijlstra 2025-07-11   71   *	ACQUIRE(pci_dev_try, lock)(dev);
857d18f23ab172 Peter Zijlstra 2025-07-11   72   *	rc = ACQUIRE_ERR(pci_dev_try, &lock);
857d18f23ab172 Peter Zijlstra 2025-07-11   73   *	if (rc)
857d18f23ab172 Peter Zijlstra 2025-07-11   74   *		return rc;
857d18f23ab172 Peter Zijlstra 2025-07-11   75   *	// @lock is held
857d18f23ab172 Peter Zijlstra 2025-07-11   76   *
857d18f23ab172 Peter Zijlstra 2025-07-11   77   * Now, when a function uses both __free() and guard()/ACQUIRE(), or
857d18f23ab172 Peter Zijlstra 2025-07-11   78   * multiple instances of __free(), the LIFO order of variable definition
857d18f23ab172 Peter Zijlstra 2025-07-11   79   * order matters. GCC documentation says:
d5934e76316e84 Dan Williams   2024-03-29   80   *
d5934e76316e84 Dan Williams   2024-03-29   81   * "When multiple variables in the same scope have cleanup attributes,
d5934e76316e84 Dan Williams   2024-03-29   82   * at exit from the scope their associated cleanup functions are run in
d5934e76316e84 Dan Williams   2024-03-29   83   * reverse order of definition (last defined, first cleanup)."
d5934e76316e84 Dan Williams   2024-03-29   84   *
d5934e76316e84 Dan Williams   2024-03-29   85   * When the unwind order matters it requires that variables be defined
d5934e76316e84 Dan Williams   2024-03-29   86   * mid-function scope rather than at the top of the file.  Take the
d5934e76316e84 Dan Williams   2024-03-29   87   * following example and notice the bug highlighted by "!!"::
d5934e76316e84 Dan Williams   2024-03-29   88   *
d5934e76316e84 Dan Williams   2024-03-29   89   *	LIST_HEAD(list);
d5934e76316e84 Dan Williams   2024-03-29   90   *	DEFINE_MUTEX(lock);
d5934e76316e84 Dan Williams   2024-03-29   91   *
d5934e76316e84 Dan Williams   2024-03-29   92   *	struct object {
d5934e76316e84 Dan Williams   2024-03-29   93   *	        struct list_head node;
d5934e76316e84 Dan Williams   2024-03-29   94   *	};
d5934e76316e84 Dan Williams   2024-03-29   95   *
d5934e76316e84 Dan Williams   2024-03-29   96   *	static struct object *alloc_add(void)
d5934e76316e84 Dan Williams   2024-03-29   97   *	{
d5934e76316e84 Dan Williams   2024-03-29   98   *	        struct object *obj;
d5934e76316e84 Dan Williams   2024-03-29   99   *
d5934e76316e84 Dan Williams   2024-03-29  100   *	        lockdep_assert_held(&lock);
d5934e76316e84 Dan Williams   2024-03-29  101   *	        obj = kzalloc(sizeof(*obj), GFP_KERNEL);
d5934e76316e84 Dan Williams   2024-03-29  102   *	        if (obj) {
d5934e76316e84 Dan Williams   2024-03-29  103   *	                LIST_HEAD_INIT(&obj->node);
d5934e76316e84 Dan Williams   2024-03-29  104   *	                list_add(obj->node, &list):
d5934e76316e84 Dan Williams   2024-03-29  105   *	        }
d5934e76316e84 Dan Williams   2024-03-29  106   *	        return obj;
d5934e76316e84 Dan Williams   2024-03-29  107   *	}
d5934e76316e84 Dan Williams   2024-03-29  108   *
d5934e76316e84 Dan Williams   2024-03-29  109   *	static void remove_free(struct object *obj)
d5934e76316e84 Dan Williams   2024-03-29  110   *	{
d5934e76316e84 Dan Williams   2024-03-29  111   *	        lockdep_assert_held(&lock);
d5934e76316e84 Dan Williams   2024-03-29  112   *	        list_del(&obj->node);
d5934e76316e84 Dan Williams   2024-03-29  113   *	        kfree(obj);
d5934e76316e84 Dan Williams   2024-03-29  114   *	}
d5934e76316e84 Dan Williams   2024-03-29  115   *
d5934e76316e84 Dan Williams   2024-03-29  116   *	DEFINE_FREE(remove_free, struct object *, if (_T) remove_free(_T))
d5934e76316e84 Dan Williams   2024-03-29  117   *	static int init(void)
d5934e76316e84 Dan Williams   2024-03-29  118   *	{
d5934e76316e84 Dan Williams   2024-03-29  119   *	        struct object *obj __free(remove_free) = NULL;
d5934e76316e84 Dan Williams   2024-03-29  120   *	        int err;
d5934e76316e84 Dan Williams   2024-03-29  121   *
d5934e76316e84 Dan Williams   2024-03-29  122   *	        guard(mutex)(&lock);
d5934e76316e84 Dan Williams   2024-03-29  123   *	        obj = alloc_add();
d5934e76316e84 Dan Williams   2024-03-29  124   *
d5934e76316e84 Dan Williams   2024-03-29  125   *	        if (!obj)
d5934e76316e84 Dan Williams   2024-03-29  126   *	                return -ENOMEM;
d5934e76316e84 Dan Williams   2024-03-29  127   *
d5934e76316e84 Dan Williams   2024-03-29  128   *	        err = other_init(obj);
d5934e76316e84 Dan Williams   2024-03-29  129   *	        if (err)
d5934e76316e84 Dan Williams   2024-03-29  130   *	                return err; // remove_free() called without the lock!!
d5934e76316e84 Dan Williams   2024-03-29  131   *
d5934e76316e84 Dan Williams   2024-03-29  132   *	        no_free_ptr(obj);
d5934e76316e84 Dan Williams   2024-03-29  133   *	        return 0;
d5934e76316e84 Dan Williams   2024-03-29  134   *	}
d5934e76316e84 Dan Williams   2024-03-29  135   *
d5934e76316e84 Dan Williams   2024-03-29  136   * That bug is fixed by changing init() to call guard() and define +
d5934e76316e84 Dan Williams   2024-03-29  137   * initialize @obj in this order::
d5934e76316e84 Dan Williams   2024-03-29  138   *
d5934e76316e84 Dan Williams   2024-03-29  139   *	guard(mutex)(&lock);
d5934e76316e84 Dan Williams   2024-03-29  140   *	struct object *obj __free(remove_free) = alloc_add();
d5934e76316e84 Dan Williams   2024-03-29  141   *
d5934e76316e84 Dan Williams   2024-03-29  142   * Given that the "__free(...) = NULL" pattern for variables defined at
d5934e76316e84 Dan Williams   2024-03-29  143   * the top of the function poses this potential interdependency problem
d5934e76316e84 Dan Williams   2024-03-29  144   * the recommendation is to always define and assign variables in one
d5934e76316e84 Dan Williams   2024-03-29  145   * statement and not group variable definitions at the top of the
d5934e76316e84 Dan Williams   2024-03-29  146   * function when __free() is used.
d5934e76316e84 Dan Williams   2024-03-29  147   *
d5934e76316e84 Dan Williams   2024-03-29  148   * Lastly, given that the benefit of cleanup helpers is removal of
d5934e76316e84 Dan Williams   2024-03-29  149   * "goto", and that the "goto" statement can jump between scopes, the
d5934e76316e84 Dan Williams   2024-03-29  150   * expectation is that usage of "goto" and cleanup helpers is never
d5934e76316e84 Dan Williams   2024-03-29  151   * mixed in the same function. I.e. for a given routine, convert all
d5934e76316e84 Dan Williams   2024-03-29  152   * resources that need a "goto" cleanup to scope-based cleanup, or
d5934e76316e84 Dan Williams   2024-03-29  153   * convert none of them.
d5934e76316e84 Dan Williams   2024-03-29  154   */
d5934e76316e84 Dan Williams   2024-03-29  155  
54da6a0924311c Peter Zijlstra 2023-05-26  156  /*
54da6a0924311c Peter Zijlstra 2023-05-26  157   * DEFINE_FREE(name, type, free):
54da6a0924311c Peter Zijlstra 2023-05-26  158   *	simple helper macro that defines the required wrapper for a __free()
85be6d84244706 Peter Zijlstra 2023-08-15  159   *	based cleanup function. @free is an expression using '_T' to access the
85be6d84244706 Peter Zijlstra 2023-08-15  160   *	variable. @free should typically include a NULL test before calling a
85be6d84244706 Peter Zijlstra 2023-08-15  161   *	function, see the example below.
54da6a0924311c Peter Zijlstra 2023-05-26  162   *
54da6a0924311c Peter Zijlstra 2023-05-26  163   * __free(name):
54da6a0924311c Peter Zijlstra 2023-05-26  164   *	variable attribute to add a scoped based cleanup to the variable.
54da6a0924311c Peter Zijlstra 2023-05-26  165   *
54da6a0924311c Peter Zijlstra 2023-05-26  166   * no_free_ptr(var):
54da6a0924311c Peter Zijlstra 2023-05-26  167   *	like a non-atomic xchg(var, NULL), such that the cleanup function will
54da6a0924311c Peter Zijlstra 2023-05-26  168   *	be inhibited -- provided it sanely deals with a NULL value.
54da6a0924311c Peter Zijlstra 2023-05-26  169   *
85be6d84244706 Peter Zijlstra 2023-08-15  170   *	NOTE: this has __must_check semantics so that it is harder to accidentally
85be6d84244706 Peter Zijlstra 2023-08-15  171   *	leak the resource.
85be6d84244706 Peter Zijlstra 2023-08-15  172   *
54da6a0924311c Peter Zijlstra 2023-05-26  173   * return_ptr(p):
54da6a0924311c Peter Zijlstra 2023-05-26  174   *	returns p while inhibiting the __free().
54da6a0924311c Peter Zijlstra 2023-05-26  175   *
54da6a0924311c Peter Zijlstra 2023-05-26  176   * Ex.
54da6a0924311c Peter Zijlstra 2023-05-26  177   *
54da6a0924311c Peter Zijlstra 2023-05-26  178   * DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
54da6a0924311c Peter Zijlstra 2023-05-26  179   *
85be6d84244706 Peter Zijlstra 2023-08-15  180   * void *alloc_obj(...)
85be6d84244706 Peter Zijlstra 2023-08-15  181   * {
54da6a0924311c Peter Zijlstra 2023-05-26  182   *	struct obj *p __free(kfree) = kmalloc(...);
54da6a0924311c Peter Zijlstra 2023-05-26  183   *	if (!p)
54da6a0924311c Peter Zijlstra 2023-05-26  184   *		return NULL;
54da6a0924311c Peter Zijlstra 2023-05-26  185   *
54da6a0924311c Peter Zijlstra 2023-05-26  186   *	if (!init_obj(p))
54da6a0924311c Peter Zijlstra 2023-05-26  187   *		return NULL;
54da6a0924311c Peter Zijlstra 2023-05-26  188   *
54da6a0924311c Peter Zijlstra 2023-05-26  189   *	return_ptr(p);
85be6d84244706 Peter Zijlstra 2023-08-15  190   * }
85be6d84244706 Peter Zijlstra 2023-08-15  191   *
85be6d84244706 Peter Zijlstra 2023-08-15  192   * NOTE: the DEFINE_FREE()'s @free expression includes a NULL test even though
85be6d84244706 Peter Zijlstra 2023-08-15  193   * kfree() is fine to be called with a NULL value. This is on purpose. This way
85be6d84244706 Peter Zijlstra 2023-08-15  194   * the compiler sees the end of our alloc_obj() function as:
85be6d84244706 Peter Zijlstra 2023-08-15  195   *
85be6d84244706 Peter Zijlstra 2023-08-15  196   *	tmp = p;
85be6d84244706 Peter Zijlstra 2023-08-15  197   *	p = NULL;
85be6d84244706 Peter Zijlstra 2023-08-15  198   *	if (p)
85be6d84244706 Peter Zijlstra 2023-08-15  199   *		kfree(p);
85be6d84244706 Peter Zijlstra 2023-08-15  200   *	return tmp;
85be6d84244706 Peter Zijlstra 2023-08-15  201   *
85be6d84244706 Peter Zijlstra 2023-08-15  202   * And through the magic of value-propagation and dead-code-elimination, it
85be6d84244706 Peter Zijlstra 2023-08-15  203   * eliminates the actual cleanup call and compiles into:
85be6d84244706 Peter Zijlstra 2023-08-15  204   *
85be6d84244706 Peter Zijlstra 2023-08-15  205   *	return p;
85be6d84244706 Peter Zijlstra 2023-08-15  206   *
85be6d84244706 Peter Zijlstra 2023-08-15  207   * Without the NULL test it turns into a mess and the compiler can't help us.
54da6a0924311c Peter Zijlstra 2023-05-26  208   */
54da6a0924311c Peter Zijlstra 2023-05-26  209  
54da6a0924311c Peter Zijlstra 2023-05-26  210  #define DEFINE_FREE(_name, _type, _free) \
323d93f0432edb Peter Zijlstra 2025-10-31 @211  	static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
54da6a0924311c Peter Zijlstra 2023-05-26  212  

:::::: The code at line 211 was first introduced by commit
:::::: 323d93f0432edb5415c79bd35e15e5754a76e486 cleanup: Always inline everything

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
