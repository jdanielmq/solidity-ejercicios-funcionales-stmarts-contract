// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract E {
    event Log(string message);

    function foo() public virtual  {
        emit Log("E.foo original");
    }

    function bar() public virtual {
        emit Log("E.bar Original");
    }
}

contract F is E {
    function foo() virtual public override {
        emit Log("F.foo original F");
        E.foo();
    }

    function bar() virtual  public override  {
        emit Log("F.bar Original F");
        super.bar();
    }
}

contract G is E {
    function foo() virtual  public override {
        emit Log("G.foo original G");
        E.foo();
    }

    function bar() virtual  public override  {
        emit Log("G.bar Original G");
        super.bar();
    }
}

contract H is F,G {
    function foo() public override(F,G) {
        F.foo();
    }

    function bar() public override(F,G)  {
        G.bar();
    }
}