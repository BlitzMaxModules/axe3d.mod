#include <iostream>

using namespace std;

extern "C" int osgmain();

int main()
{
    osgmain();
    cout << "Hello world!" << endl;
    return 0;
}
